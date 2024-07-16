package teamproject.ssja.controller;

import static org.assertj.core.api.Assertions.*;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.mapper.MembersMapper;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.service.user.CustomUserDetailsService;

@SpringBootTest
@Slf4j
@AutoConfigureMockMvc
@Transactional
public class MyPageTest {

	@Autowired
	MockMvc mockMvc;

	@Autowired
	CustomUserDetailsService customUserDetailsService;
	@Autowired
	private ObjectMapper objectMapper;
	@Autowired
	MembersMapper membersMapper;

	@Test
	void mockTest() throws Exception {
		mockMvc.perform(get("/myPage"));
	}

	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testMyPageUser() throws Exception {
		MvcResult result = mockMvc.perform(get("/myPage")).andExpect(status().isOk()).andReturn();

		String viewName = checkViewName(result);
		assertThat(viewName).isEqualTo("/myPage/MyPage");
	}

	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testMyPageAdmin() throws Exception {
		mockMvc.perform(get("/myPage")).andExpect(status().is3xxRedirection());

	}

	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testViewForward() throws Exception {
		MvcResult result = mockMvc.perform(get("/myPage/orderInfo"))
				.andExpect(status().isOk()).andReturn();

		String viewName = checkViewName(result);
		assertThat(viewName).isEqualTo("/myPage/MyPage");

		MvcResult result2 = mockMvc.perform(get("/myPage/password/change"))
				.andExpect(status().isOk()).andReturn();

		String viewName2 = checkViewName(result2);
		assertThat(viewName).isEqualTo("/myPage/MyPage");

		
	}

	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testUpdateAddress() throws Exception {
		Long id = InfoProvider.getM_NO();
		AddressForm form = new AddressForm("zipcode", "addr1","addr2", id);
		
		mockMvc.perform(post("/user/address")
				.with(csrf())
		         .contentType(MediaType.APPLICATION_JSON) 		
		         .content(objectMapper.writeValueAsString(form)))
		.andExpect(status().isOk());
		MembersDto member = membersMapper.getMember(id);
		
		
		assertThat(member.getM_ZIPCODE()).isEqualTo("zipcode");
		assertThat(member.getM_ADDRESS1()).isEqualTo("addr1");
		assertThat(member.getM_ADDRESS2()).isEqualTo("addr2");
	}
	
	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testCheckDuplicateBizName() throws Exception {
	    mockMvc.perform(get("/user/bizname/check-duplicate")
	            .param("bizName", "test3"))
	            .andExpect(status().isOk())
	            .andExpect(content().string("test3"));
	}
	
	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testCheckUnDupleBizName() throws Exception {
		MockHttpServletResponse response =mockMvc.perform(get("/user/bizname/check-duplicate")
				.param("bizName", "test142141214124"))
		.andReturn().getResponse();
	
		 String result = response.getContentAsString();
			assertThat(result).isEqualTo("test142141214124");
	}
	
	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testGetCartItems() throws Exception {
		Long id = InfoProvider.getM_NO();
		int pageNum = 1;
		MvcResult mvcResult = mockMvc.perform(get("/user/cart/items")
				.param("pageNum", "1"))
				.andExpect(status().isOk())
				.andReturn();
		
		 String jsonResponse = mvcResult.getResponse().getContentAsString();
		    ListObjectPagingDTO data = 
		    		objectMapper.readValue(jsonResponse, ListObjectPagingDTO.class);
		    
		    assertThat(data.getPageNum()).isEqualTo(pageNum);
		    assertThat(data.getObjectList()).isNotNull();
	}
	
	
	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testGetCommus() throws Exception {
		Long id = InfoProvider.getM_NO();
		int pageNum = 1;
		MvcResult mvcResult = mockMvc.perform(get("/user/info/community")
				.param("pageNum", "1"))
				.andExpect(status().isOk())
				.andReturn();
		
		 String jsonResponse = mvcResult.getResponse().getContentAsString();
		    ListObjectPagingDTO data = 
		    		objectMapper.readValue(jsonResponse, ListObjectPagingDTO.class);
		    
		    assertThat(data.getPageNum()).isEqualTo(pageNum);
		    assertThat(data.getObjectList()).isNotNull();
	}
	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testGetQnAs() throws Exception {
		Long id = InfoProvider.getM_NO();
		int pageNum = 1;
		MvcResult mvcResult = mockMvc.perform(get("/user/info/qna")
				.param("pageNum", "1"))
				.andExpect(status().isOk())
				.andReturn();
		
		 String jsonResponse = mvcResult.getResponse().getContentAsString();
		    ListObjectPagingDTO data = 
		    		objectMapper.readValue(jsonResponse, ListObjectPagingDTO.class);
		    
		    assertThat(data.getPageNum()).isEqualTo(pageNum);
		    assertThat(data.getObjectList()).isNotNull();
	}
	
	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testCheckIsVendor() throws Exception {
		MvcResult mvcResult = mockMvc.perform(get("/user/check/apply-vendor"))
				.andExpect(status().isOk())
				.andReturn();
		
		 String jsonResponse = mvcResult.getResponse().getContentAsString();
		 assertThat(jsonResponse).isEqualTo("N");
	}
	
	private String checkViewName(MvcResult result) {
		ModelAndView resultMV = result.getModelAndView();

		Map<String, Object> model = resultMV.getModel();
		return resultMV.getViewName();
	}

}