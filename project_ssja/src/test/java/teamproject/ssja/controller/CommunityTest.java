package teamproject.ssja.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
@AutoConfigureMockMvc
class CommunityTest {

	@Autowired
	private MockMvc mockMvc;
	@Test
	void testCommunityPreviewPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/community"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	@Test
	void testCommunityMainPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/community/main"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	@Test
	void testCommunityContentPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/community/content/11968"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	@Test
	void testCommunityinsertPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/community/content/insert"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	@Test
	void testDeleteTempImg() throws Exception {
		
        mockMvc.perform(MockMvcRequestBuilders.post("/community/tempImg")
				.contentType(MediaType.APPLICATION_JSON)
				.param("list[]", "/images/board_content/1719303112047_5251.png,/images/board_content/1719284359584_7859.png")
				.with(csrf())
				.accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
        }

	@Test
	void testModifyContent() throws Exception {
        
		String responseJson = "{\"title\":\"1234\",\"content\":\"5678\"}";

        mockMvc.perform(MockMvcRequestBuilders.post("/community/content/modify/11888")
				.content(responseJson)
				.contentType(MediaType.APPLICATION_JSON)
				.with(csrf())
				.accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
        }

	@Test
	void testCommunityGetReply() throws Exception {
				
		mockMvc.perform(MockMvcRequestBuilders.get("/community/reply")
			   .contentType(MediaType.APPLICATION_JSON)
			   .with(csrf())
			   .param("replyNum", "1")
			   .param("amount", "20")
			   .param("bno", "11923")
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityInsertReply() throws Exception {
		
		String responseJson = "{\"rbno\":\"11923\",\"rmno\":\"21\",\"rwriter\":\"test\",\"rcontent\":\"흠\",\"rgroup\":\"0\",\"rstep\":\"0\",\"rindent\":\"0\"}";
		
		mockMvc.perform(MockMvcRequestBuilders.post("/community/reply")
			   .content(responseJson)
			   .contentType(MediaType.APPLICATION_JSON)
			   .with(csrf())
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityUpdateReply() throws Exception {
		
		String responseJson = "{\"content\":\"수정본\"}";
		
		mockMvc.perform(MockMvcRequestBuilders.put("/community/reply/587")
			   .content(responseJson)
			   .contentType(MediaType.APPLICATION_JSON)
			   .with(csrf())
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	


	@Test
	void testCommunityGetReplyTotal() throws Exception {
			
		mockMvc.perform(MockMvcRequestBuilders.get("/community/replyTotal")
				.param("bno", "11923"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityGetBoardLiked() throws Exception {
			
		mockMvc.perform(MockMvcRequestBuilders.get("/community/boradLiked")
				.param("bno", "11923"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityInsertBoardLiked() throws Exception {
		
		String responseJson = "{\"bno\":\"11923\",\"mno\":\"22\"}";
		
		mockMvc.perform(MockMvcRequestBuilders.post("/community/boradLiked")
			   .content(responseJson)
			   .contentType(MediaType.APPLICATION_JSON)
			   .with(csrf())
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	

	@Test
	void testCommunityGetBoardISLiked() throws Exception {
			
		mockMvc.perform(MockMvcRequestBuilders.get("/community/boradIsLiked")
			   .param("bno", "11923")
			   .param("mno", "21"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	
	@Test
	void testCommunityGetPost() throws Exception {
		
		
		mockMvc.perform(MockMvcRequestBuilders.get("/community/post/11923")
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityInsertPost() throws Exception {
        
		String responseJson = "{\"mno\":\"21\",\"category\":\"40\",\"writer\":\"test\",\"title\":\"테스트\",\"content\":\"테스트용도\"}";

		mockMvc.perform(MockMvcRequestBuilders.post("/community/post")
				.content(responseJson)
				.contentType(MediaType.APPLICATION_JSON)
				.with(csrf())
				.accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	

	@Test
	void testCommunityDeletePost() throws Exception {
        
		mockMvc.perform(MockMvcRequestBuilders.delete("/community/post")
				.param("bno", "11981")
				.with(csrf())
				.accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}


	@Test
	void testCommunityGetBestPost() throws Exception {
		
		
		mockMvc.perform(MockMvcRequestBuilders.get("/community/bestPost")
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityGetSearchPost() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.get("/community/search")
			   .param("pageNum", "1")
			   .param("amount", "20")
			   .param("option", "content")
			   .param("keyword", "테스트"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityGetProduct() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.get("/community/product/1956"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testCommunityGetProducts() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.get("/community/product")
			   .param("keyword", ""))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}


	@Test
	void testCommunityInsertProduct() throws Exception {
        String responseJson = "{\"bno\":\"11880\",\"proNo\":\"1956\"}";

		mockMvc.perform(MockMvcRequestBuilders.post("/community/product")
				.content(responseJson)
				.contentType(MediaType.APPLICATION_JSON)
				.with(csrf())
				.accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Test
	void testTermsModify() throws Exception {
		
		mockMvc.perform(MockMvcRequestBuilders.get("/community/userinfo/21"))
				   .andExpect(MockMvcResultMatchers.status().isOk())
				   .andDo(print());	
		}
	


}
