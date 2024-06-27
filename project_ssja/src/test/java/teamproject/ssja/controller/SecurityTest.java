package teamproject.ssja.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.security.Principal;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.OAuth2LoginTestUserUtil;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.service.user.CustomUserDetailsService;

@SpringBootTest
@Slf4j
@Transactional
@AutoConfigureMockMvc
public class SecurityTest {
	
	@Autowired
	 MockMvc mockMvc;
	 @Autowired
	 CustomUserDetailsService customUserDetailsService;

	 @Test
		void testUnAuthorizedUser() throws Exception {
		
			
		        mockMvc.perform(get("/myPage")
						 .with(SecurityMockMvcRequestPostProcessors.csrf()))
						.andExpect(status().isFound());//로그인 페이지 리다이렉트에 대한 302체크
		        
		}
	 
	 @Test
	 @WithUserDetails(value="test1", userDetailsServiceBeanName = "customUserDetail")
	 void springSecuritySessionTest() {
		 Authentication userInfo=SecurityContextHolder.getContext().getAuthentication();
		
		 assertNotNull(userInfo);
		 assertNotNull(userInfo.getPrincipal());
		Long memberNo =  InfoProvider.getM_NO();
		 assertThat(memberNo).isEqualTo(22);
		 assertThat(userInfo instanceof Principal).isEqualTo(true);
	 }
	 
	 @Test
	 @WithUserDetails(value="test1", userDetailsServiceBeanName = "customUserDetail")
	 void springSecuritySocailTest() throws Exception {
		 mockMvc.perform(post("/user-info/total/order?pageNum=1")
				 .with(OAuth2LoginTestUserUtil.oauth2Login())
				 .with(SecurityMockMvcRequestPostProcessors.csrf()))
				.andExpect(status().isOk());
		
	 }
	 
	 @Test
	 @WithUserDetails(value="test1", userDetailsServiceBeanName = "customUserDetail")
	 void accessTest() throws Exception {
		 mockMvc.perform(get("/myPage")
				 .with(csrf()))
				.andExpect(status().isOk());
		 
		 mockMvc.perform(get("/vendor")
				 .with(csrf()))
				.andExpect(status().isOk());
	 }
	 
	 
	 
	
}