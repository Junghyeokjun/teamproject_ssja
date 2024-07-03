package teamproject.ssja.configure;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.logout.SimpleUrlLogoutSuccessHandler;
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;
import org.springframework.security.web.session.HttpSessionEventPublisher;
import org.springframework.security.web.session.SessionManagementFilter;

import teamproject.ssja.configure.security.CustomAuthenticationFailurHandler;
import teamproject.ssja.configure.security.SessionRenewFilter;
import teamproject.ssja.service.user.CustomUserDetailsService;
import teamproject.ssja.service.user.OAuth2UserService;





@Configuration
@EnableWebSecurity//스프링 시큐리티 필터가 스프링 필터체인에 등록됨
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	   @Autowired
	    private CustomUserDetailsService customUserDetailsService;
	   
	   @Autowired
	   private PasswordEncoder passwordEncoder;
	   
	   @Autowired
	   private OAuth2UserService oAuth2UserService;
	   @Autowired
	   private CustomAuthenticationFailurHandler AuthenticationFailureHandler;
	   @Autowired
	   SessionRenewFilter sessionRenewFilter;
	 


	 @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		     auth.userDetailsService(customUserDetailsService)
		     .passwordEncoder(passwordEncoder);
		    
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		

//		web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
		web.ignoring().antMatchers("/css/**","/js/**","/imgx/**","/lib/**","/images/**");
		  web.httpFirewall(allowUrlEncodeFirewall());
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
//	http.csrf().disable();
		/* 권한설정 */
	    http
	    .addFilterBefore(sessionRenewFilter, SessionManagementFilter.class)
	    .authorizeRequests()
	    .antMatchers("/vendor/","/vendor/**","/api/vendor/**").hasAnyRole("VENDOR")
	    .antMatchers("/logout","/user","/myPage","/myPage/**","/userInfo","/user","/charge","/charge/**","/vendor/info/**",
	    		"/user/**","/wishlist","/wishlist/**","/sign-up","/sign-up/**","/wishlist","/purchase","/item_cart/**").hasAnyRole("USER","SOCIAL")
	    .anyRequest().permitAll();
	    
	    http.formLogin()
	    .loginPage("/login")
	    .usernameParameter("username").passwordParameter("password")
	    .loginProcessingUrl("/loginCheck")
	    .failureHandler(AuthenticationFailureHandler)
	    .defaultSuccessUrl("/home").permitAll();
	    
	       http.oauth2Login()
           .loginPage("/login")
           .userInfoEndpoint()
           .userService(oAuth2UserService)
           .and()
           .defaultSuccessUrl("/home")
           .failureUrl("/login?error=true");
	       
	    http.
	    logout()
        .logoutUrl("/logout")
        //.logoutSuccessHandler(new CustomLogoutSuccessHandler())
        .logoutSuccessUrl("/login")
        .invalidateHttpSession(true)
        .deleteCookies("JSESSIONID");
	    
              http//중복로그인 설정
                .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/home") 
                .maxSessionsPreventsLogin(false)
                .sessionRegistry(sessionRegistry())
                
                .and()// 세션 고정 공격 보호
                .sessionFixation()
                .newSession();

	}	
	


	//계층 권한
	 @Bean
	    protected RoleHierarchy roleHierarchy(){
	        RoleHierarchyImpl hierarchy = new RoleHierarchyImpl();
	        hierarchy.setHierarchy("ROLE_ADMIN > ROLE_VENDOR > ROLE_USER");
	        return hierarchy;
	    }
	 
	 @Bean
	 protected SessionAuthenticationStrategy sessionAuthenticationStrategy() {
	        return new ConcurrentSessionControlAuthenticationStrategy(sessionRegistry());
	    }
	 
	 @Bean//현재 세션을 추적할 수 있도록 설정
	 protected SessionRegistry sessionRegistry() {
	        return new SessionRegistryImpl();
	    }
	 
	 @Bean 
	 protected HttpSessionEventPublisher httpSessionEventPublisher() {
	        return new HttpSessionEventPublisher();
	    }
	 
	 public class CustomLogoutSuccessHandler extends SimpleUrlLogoutSuccessHandler {
	        @Override
	        public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, 
	        		Authentication authentication) throws IOException, ServletException {
	        	
	            HttpSession session = request.getSession();
	            if (session != null) {
	                session.invalidate();
	            }
	            String logoutUrl = "https://nid.naver.com/nidlogin.logout"; 
	            response.sendRedirect(logoutUrl);
	        }
	    }
	 
	 @Bean
	 public HttpFirewall allowUrlEncodeFirewall() {
		 StrictHttpFirewall firewall = new StrictHttpFirewall();
		 firewall.setAllowUrlEncodedSlash(true);
		 firewall.setAllowUrlEncodedDoubleSlash(true);
		 return firewall;
	 }
}