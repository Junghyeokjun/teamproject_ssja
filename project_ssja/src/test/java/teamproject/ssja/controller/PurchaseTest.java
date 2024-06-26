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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;

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
		
		MultiValueMap<String, String> data= new LinkedMultiValueMap<String, String>(); 
		
		data.add("M_NO", "21");
		data.add("PUR_TOT", "84431");
		data.add("PUR_DC", "84431");
		data.add("PUR_PAY", "0");
		data.add("PUR_PAYMENT", "discount");
		data.add("PUR_DVADDRESS", "부산 남구 진남로232번길 2 1층");
		data.add("PUR_DV", "대한통운");
		data.add("USE_POINT", "84431");
		data.add("products[0][product_no]", "2689");
		data.add("products[0][price]", "84431");
		data.add("products[0][quantity]", "1");
		data.add("products[0][pay]", "0");
		data.add("products[0][coupon]", "0");
		
//        String responseJson = "{\"M_NO\":\"21\", \"PUR_TOT\":\"84431\", \"PUR_DC\":\"84431\", \"PUR_PAY\":\"0\", \"PUR_PAYMENT\":\"discount\", \"PUR_DVADDRESS\":\"부산 남구 진남로232번길 2 1층\", \"PUR_DV\":\"대한통운\", \"USE_POINT\":\"84431\", \"products[0][product_no]\":\"2689\", \"products[0][price]\":\"84431\", \"products[0][quantity]\":\"1\", \"products[0][discount]\":\"84431\", \"products[0][pay]\":\"0\", \"products[0][coupon]\":\"0\"}";
		mockMvc.perform(MockMvcRequestBuilders.post("/purchase/success")
			   .params(data)
			   .contentType(MediaType.APPLICATION_JSON)
			   .with(csrf())
			   .accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	}

//	@Disabled
	@Test
	void testPurchaseCompletePage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/purchase/complete")
			   .param("price", "11111"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	}
}
