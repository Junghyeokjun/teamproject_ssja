package teamproject.ssja.configure;

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
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.security.core.session.SessionRegistryImpl;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.session.ConcurrentSessionControlAuthenticationStrategy;
import org.springframework.security.web.authentication.session.SessionAuthenticationStrategy;
import org.springframework.security.web.session.HttpSessionEventPublisher;

import teamproject.ssja.dto.logindto.CustomUserDetailsDTO;
import teamproject.ssja.service.user.CustomUserDetailsService;




@Configuration
@EnableWebSecurity//스프링 시큐리티 필터가 스프링 필터체인에 등록됨
public class SecurityConfig extends WebSecurityConfigurerAdapter{


	@Override
	public void configure(WebSecurity web) throws Exception {
		
//		web.ignoring().requestMatchers(PathRequest.toStaticResources().atCommonLocations());
		web.ignoring().antMatchers("/css/**","/js/**","/imgx/**","/lib/**","/images/**");
	}
	
	
	@Override
	public void configure(HttpSecurity http) throws Exception {
	
		/* 권한설정 */
	    http.authorizeRequests()
	    .antMatchers("/","/test/login","/test/sign_up_before","/test/sign_up","/testrest/**").permitAll()
	    .antMatchers("/logout","/user","/myPage","/myPage/**","/userInfo","/user","/user/**").hasAnyRole("USER")
	    .anyRequest().permitAll();
	    
	    http.formLogin().loginPage("/login")
	    .usernameParameter("username").passwordParameter("password")
	    .loginProcessingUrl("/loginCheck")
	    .defaultSuccessUrl("/").permitAll()
	    .and()
	    .logout()
                .logoutUrl("/logout")//logout 요청 처리 uRL
                .addLogoutHandler((request, response, authentication) -> {
                    HttpSession session = request.getSession();
                    if (session != null) {
                        session.invalidate();
                    }
                }).logoutSuccessHandler(((request, response, authentication) -> {
                    response.sendRedirect("/");// 로그아웃 성공 시 리다이렉트
                }))//로그 아웃 성공 핸들러;
                .deleteCookies("JSESSIONID")
                
                .and()//중복로그인 설정
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
	    public RoleHierarchy roleHierarchy(){
	        RoleHierarchyImpl hierarchy = new RoleHierarchyImpl();
	        hierarchy.setHierarchy("ROLE_ADMIN > ROLE_USER");
	        return hierarchy;
	    }
	 
	
	//테스트용 유저 만들기(인메모리 방식)
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		 
		auth.inMemoryAuthentication()
		.withUser("memberajs").password("1111").roles("USER")
		.and()
		.withUser("memberss").password("1111").roles("USER")
		.and()
		.withUser("membersjy").password("1111").roles("USER")
		.and()
		.withUser("memberjhj").password("1111").roles("USER")
		.and()
		.withUser("admin").password("admin").roles("ADMIN");
	
	}
	
	 @Bean
	    public SessionAuthenticationStrategy sessionAuthenticationStrategy() {
	        return new ConcurrentSessionControlAuthenticationStrategy(sessionRegistry());
	    }
	 
	 @Bean//현재 세션을 추적할 수 있도록 설정
	    public SessionRegistry sessionRegistry() {
	        return new SessionRegistryImpl();
	    }
	 
	 @Bean // 세션 생성 및 소멸 이벤트를 처리하는 역할
	    public HttpSessionEventPublisher httpSessionEventPublisher() {
	        return new HttpSessionEventPublisher();
	    }
}
