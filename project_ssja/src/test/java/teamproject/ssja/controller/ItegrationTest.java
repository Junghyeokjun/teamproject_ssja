package teamproject.ssja.controller;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Collections;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.mainpage.MainPageDTO;
import teamproject.ssja.dto.product.SearchForm;
import teamproject.ssja.dto.userinfo.ChangePasswordForm;
import teamproject.ssja.page.ListObjectPagingDTO;

@SpringBootTest
@Slf4j
@Transactional
@AutoConfigureMockMvc
public class ItegrationTest {
	
	@Autowired
	 MockMvc mockMvc;
	
	   @Autowired
	    private ObjectMapper objectMapper;
	
	@Test
	@WithUserDetails(value="test1", userDetailsServiceBeanName = "customUserDetail")
	void myPageTest() throws Exception{
		 mockMvc.perform(get("/myPage")
				 .with(SecurityMockMvcRequestPostProcessors.csrf()))
				.andExpect(status().isOk());
	}
	
	@Test
	@WithUserDetails(value="test1", userDetailsServiceBeanName = "customUserDetail")
	void myPageApiTest() throws Exception {
		
		
		ChangePasswordForm changePasswordForm = new ChangePasswordForm("1111", "1234");	
		  
		 MvcResult result = mockMvc.perform(post("/user/password-change")
				 .with(csrf())
	                .contentType(MediaType.APPLICATION_JSON)
	                .content(objectMapper.writeValueAsString(changePasswordForm)))
	                .andExpect(status().isOk())
	                .andReturn();
		 log.info("result : {}", result);
		 assertNotNull(result);
		 
	}
	
	

	@Test
	@WithUserDetails(value="test1", userDetailsServiceBeanName = "customUserDetail")
	void testPwChangeCurrentPwWrong() throws Exception {
		
		
		ChangePasswordForm changePasswordForm = new ChangePasswordForm("1234", "4224");	
		  
			mockMvc.perform(post("/user/password-change")
				 .with(csrf())
	                .contentType(MediaType.APPLICATION_JSON)
	                .content(objectMapper.writeValueAsString(changePasswordForm)))
	                .andExpect(status().isBadRequest());
	          
	}
	
	@Test
	@WithUserDetails(value="test1", userDetailsServiceBeanName = "customUserDetail")
	void testProductList() throws JsonProcessingException, Exception {
		
		SearchForm form = new SearchForm("가구", 2, 12000, 25000, "pro_sellcount desc");
		
		 MvcResult result = mockMvc.perform(post("/search/items")
				 .with(csrf())
	                .contentType(MediaType.APPLICATION_JSON)
	                .content(objectMapper.writeValueAsString(form)))
	                .andExpect(status().isOk())
	                .andReturn();
		 
		 log.info("result : {}", result.getResponse().getContentAsString());
		 assertNotNull(result);
		 assertNotNull(result.getResponse().getContentAsString());
		 
			 SearchForm form2 = new SearchForm();
				
			  mockMvc.perform(post("/search/items")
					 .with(csrf())
		                .contentType(MediaType.APPLICATION_JSON)
		                .content(objectMapper.writeValueAsString(form)))
		                .andExpect(status().isOk());
		                
	}
	
	@Test
	void testMainBestItems() throws  Exception {
		MvcResult mvcResult = mockMvc.perform(get("/home/mainpage/data")
				.param("bestPageNum", "1"))
				.andExpect(status().isOk())
				.andReturn();
		
		 String jsonResponse = mvcResult.getResponse().getContentAsString();
		 MainPageDTO data = 
		    		objectMapper.readValue(jsonResponse, MainPageDTO.class);
		    
		    log.info("resultData{} : ", data);
		    assertThat(data.getBestList()).isNotEmpty();
		    assertThat(data.getCategoryItemList()).isNotEmpty();
		    assertThat(data.getEventList()).isNotEmpty();
	}
	
}
