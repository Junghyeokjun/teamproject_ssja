package teamproject.ssja.logoutTest;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.unauthenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

@SpringBootTest
public class LogoutTest {

	
	@Autowired
	private MockMvc mockMvc;
	
	@Test
	public void testLogOutRedirect() {
		 try {
			this.mockMvc.perform(post("/logout").with(csrf()))
			    .andExpect(status().isOk())
			    .andExpect(jsonPath("$").doesNotExist())
			    .andExpect(unauthenticated())
			    .andReturn();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
