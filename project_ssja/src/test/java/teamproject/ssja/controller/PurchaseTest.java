package teamproject.ssja.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.HashMap;
import java.util.Map;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;

import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
@AutoConfigureMockMvc
class PurchaseTest {

	@Autowired
	private MockMvc mockMvc;
	
	

	@Disabled
	@Test
	void testPurchasePage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/purchase")
			   .param("quantity", "1")
			   .param("productNo", "1958"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	}

	@Disabled
	@Test
	void testCartPurchasePage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.post("/purchase/")
			   .param("deleteList", "3081")
			   .contentType(MediaType.APPLICATION_JSON)
			   .with(csrf()))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	}

	@Disabled
	@Test
	void testPurchase() throws Exception {
        String responseJson = "{\"M_NO\":\"21\", \"PUR_TOT\":\"84431\", \"PUR_DC\":\"84431\", \"PUR_PAY\":\"0\", \"PUR_PAYMENT\":\"discount\", \"PUR_DVADDRESS\":\"부산 남구 진남로232번길 2 1층\", \"PUR_DV\":\"대한통운\", \"USE_POINT\":\"84431\", \"products\":[{\"product_no\":\"2689\", \"price\":\"84431\", \"quantity\":\"1\", \"discount\":\"84431\", \"pay\":\"0\", \"coupon\":\"0\"}]}";
		mockMvc.perform(MockMvcRequestBuilders.post("/purchase/success")
			   .param("data",responseJson)
			   .contentType(MediaType.APPLICATION_JSON)
			   .with(csrf())
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	}

}
