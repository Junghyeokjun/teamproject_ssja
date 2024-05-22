package teamproject.ssja.controller;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import static org.hamcrest.Matchers.is;

@SpringBootTest
@AutoConfigureMockMvc
public class LikeControllerTest {

    @Autowired
    private MockMvc mockMvc;

    @Test
    void testToggleLike_Success() throws Exception {
        mockMvc.perform(MockMvcRequestBuilders.post("/api/likes/toggle/1")
                .param("liked", "true")
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.status().isOk())
                .andExpect(MockMvcResultMatchers.content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.jsonPath("$", is(10))); // Replace 10 with the expected value
    }

    @Test
    void testToggleLike_Exception() throws Exception {
        MockHttpServletResponse response = mockMvc.perform(MockMvcRequestBuilders.post("/api/likes/toggle/1")
                .param("liked", "true")
                .contentType(MediaType.APPLICATION_JSON)
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.status().isInternalServerError())
                .andExpect(MockMvcResultMatchers.content().contentTypeCompatibleWith(MediaType.APPLICATION_JSON))
                .andExpect(MockMvcResultMatchers.jsonPath("$", is(0))) // Replace 0 with the expected value
                .andReturn().getResponse();

        // Check if redirect occurred
        if (response.getStatus() == 302) {
            System.out.println("Redirect URL: " + response.getHeader("Location"));
        }
    }
}
