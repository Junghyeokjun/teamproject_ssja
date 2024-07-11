package teamproject.ssja.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.service.Board.BoardService;

import static org.hamcrest.Matchers.is;
import static org.mockito.Mockito.when;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;

@SpringBootTest
@AutoConfigureMockMvc
public class LikeControllerTest {

	@Autowired
	private MockMvc mockMvc;
	@MockBean
	private BoardService boardService;

	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testToggleLike_Success() throws Exception {
		LikesVO likesVO = new LikesVO();
		String bno = "1";
		when(boardService.modifyGetBoardLikes("1", "1")).thenReturn(likesVO);
		mockMvc.perform(MockMvcRequestBuilders.post("/api/likes/btoggle/{bno}",bno)
				.param("bno", "1").param("mno", "1")
				.with(csrf())
				.contentType(MediaType.APPLICATION_FORM_URLENCODED)
				.accept(MediaType.APPLICATION_JSON))
				.andExpect(MockMvcResultMatchers.status().isOk())
				.andExpect(MockMvcResultMatchers.content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON));
				//.andExpect(MockMvcResultMatchers.jsonPath("$.likeCount").value(10)); // Replace 10 with the expected value
	}

	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testToggleLike_Exception() throws Exception {
		String data = "{\"liked\": true}";
		String bno = "1";
		MockHttpServletResponse response = mockMvc
				.perform(MockMvcRequestBuilders.post("/api/likes/btoggle/{bno}",bno)
				.with(csrf())
				.param("bno", "1")
				.param("mno", "1")
				.contentType(MediaType.APPLICATION_FORM_URLENCODED)
				.accept(MediaType.APPLICATION_JSON))
				.andExpect(MockMvcResultMatchers.status().isBadRequest())
				.andExpect(MockMvcResultMatchers.content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
				.andExpect(MockMvcResultMatchers.jsonPath("$", is(0))) // Replace 0 with the expected value
				.andReturn().getResponse();

		// Check if redirect occurred
		if (response.getStatus() == 302) {
		}
	}

}
