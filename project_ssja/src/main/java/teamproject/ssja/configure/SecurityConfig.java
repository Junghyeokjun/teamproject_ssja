package teamproject.ssja.configure;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.hierarchicalroles.RoleHierarchy;
import org.springframework.security.access.hierarchicalroles.RoleHierarchyImpl;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import teamproject.ssja.service.user.CustomUserDetailsService;





@Configuration
@EnableWebSecurity//스프링 시큐리티 필터가 스프링 필터체인에 등록됨
public class SecurityConfig extends WebSecurityConfigurerAdapter{

	   @Autowired
	    private CustomUserDetailsService customUserDetailsService;
	   
	   @Autowired
	   private PasswordEncoder passwordEncoder;


	 @Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		    auth.userDetailsService(customUserDetailsService)
	        .passwordEncoder(passwordEncoder);
	}
	@Override
	public void configure(WebSecurity web) throws Exception {
		
//		web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
		web.ignoring().antMatchers("/css/**","/js/**","/imgx/**","/lib/**","/images/**");
	}
	
	
	@Override
	protected void configure(HttpSecurity http) throws Exception {
	//http.csrf().disable();
		/* 권한설정 */
	    http.authorizeRequests()
	    .antMatchers("/logout","/user","/myPage","/myPage/**","/userInfo","/user","/user/**","/wishlist","/wishlist/**").hasAnyRole("USER")
	    .anyRequest().permitAll();
	    
	    http.formLogin()
	    .loginPage("/login")
	    .usernameParameter("username").passwordParameter("password")
	    .loginProcessingUrl("/loginCheck")
	    .defaultSuccessUrl("/").permitAll();
	    
	       http.oauth2Login()
           .loginPage("/login")
           .defaultSuccessUrl("/home", true)
           .failureUrl("/login?error=true");
	       
	    http.logout()
	    
        .logoutUrl("/logout")
        .logoutSuccessUrl("/home")
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
	        hierarchy.setHierarchy("ROLE_ADMIN > ROLE_USER");
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
	 
	 @Bean // 세션 생성 및 소멸 이벤트를 처리하는 역할
	 protected HttpSessionEventPublisher httpSessionEventPublisher() {
	        return new HttpSessionEventPublisher();
	    }
}