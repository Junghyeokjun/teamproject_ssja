package teamproject.ssja.controller;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.web.servlet.MockMvc;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.service.user.CustomUserDetailsService;

@SpringBootTest
@Slf4j
@WithUserDetails(value="test", userDetailsServiceBeanName = "customUserDetail")
public class MyPageTest {
	
	 MockMvc mockMvc;
	 @Autowired
	 CustomUserDetailsService customUserDetailsService;

	 
	 @Test
	 void mockTest() throws Exception {
		 mockMvc.perform(get("/myPage"));
	 }
	

}