package teamproject.ssja.controller;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.MediaType;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.result.MockMvcResultMatchers;
import org.springframework.util.MultiValueMap;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.page.Criteria;

@Slf4j
@SpringBootTest
@AutoConfigureMockMvc
@WithMockUser(roles = "VENDOR")
class VendorControllerTest {

	@Autowired
	private MockMvc mockMvc;
	
//    @WithMockUser(roles = "VENDOR") 판매자 권한설정

	@Disabled
	@Test
	void testVendorRootPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	@Disabled
	@Test
	void testVendorWritePage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor/product/write"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	@Disabled
	@Test
	void testProductAdd() throws Exception {
		MockMultipartFile bannerFile = new MockMultipartFile("bannerFile", "banner.jpg", "image/jpeg", "banner content".getBytes());

        List<MockMultipartFile> coverFiles = new ArrayList<>();
        coverFiles.add(new MockMultipartFile("coverFile", "cover1.jpg", "image/jpeg", "cover1 content".getBytes()));
        coverFiles.add(new MockMultipartFile("coverFile", "cover2.jpg", "image/jpeg", "cover2 content".getBytes()));

        List<MockMultipartFile> explainFiles = new ArrayList<>();
        explainFiles.add(new MockMultipartFile("explainFile", "explain1.txt", "text/plain", "explain1 content".getBytes()));
        explainFiles.add(new MockMultipartFile("explainFile", "explain2.txt", "text/plain", "explain2 content".getBytes()));

        ProductDto product= new ProductDto(1, 21, 31, 1111, 111, "", 1, 1, 11, "test", "test", "", 2, 1);
        
        mockMvc.perform(MockMvcRequestBuilders.multipart("/vendor/product/add")
				.file(bannerFile)
				.file(coverFiles.get(0))
                .file(coverFiles.get(1))
                .file(explainFiles.get(0))
                .file(explainFiles.get(1))
                .flashAttr("productDto", product)
				.with(csrf())
				.accept(MediaType.APPLICATION_JSON))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
        }

	@Disabled
	@Test
	void testGetProductList() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor/product/list/21"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testProductModifyPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor/product/modify_view")
				.param("proNo", "1955")
				.queryParam("pageNum", "1")
				.queryParam("amount", "20"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	
	@Disabled
	@Test
	void testModifyProduct() throws Exception {		 
		
		mockMvc.perform(MockMvcRequestBuilders.post("/vendor/product/modify")
				.contentType(MediaType.APPLICATION_JSON)
				.param("pRO_NO", "1955")
				.param("v_NO", "1")
				.param("p_C_NO", "53")
				.param("pRO_PRICE", "64871")
				.param("pRO_QUANTITY", "31")
				.param("pRO_BANNERIMG", "/images/product_banner/bn_4.jpg")
				.param("pRO_WISH", "507")
				.param("pRO_SELLCOUNT", "467")
				.param("pRO_HIT", "702")
				.param("pRO_BIZNAME", "SSJA")
				.param("pRO_NAME", "[생활용품] 공간 최적 오븐레인지")
				.param("pRO_DATE", "24/05/27 15:11:32.000000000")
				.param("avgeval", "0")
				.param("countrv", "0")
				.with(csrf())
				.accept(MediaType.APPLICATION_JSON))
        		.andExpect(MockMvcResultMatchers.status().is3xxRedirection())
			   .andDo(print());	
	}

	@Disabled
	@Test
	void testQNAPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor/question/21")
				.queryParam("pageNum", "1")
				.queryParam("amount", "20"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testQNAContentPage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor/question/21"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testWritePage() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor/question/write_view/21"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testInfo() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/vendor/info/SSJA"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testGetPCSub() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/api/vendor/category")
				.queryParam("categoryNo", "21"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testGetTotalInfoVendor() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/api/vendor/totalInfo")
				.queryParam("bizname", "SSJA"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testGetProductCount() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/api/vendor/productcount")
				.queryParam("pageNum", "1")
				.queryParam("amount", "20"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testGetQnascount() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/api/vendor/qnascount")
				.queryParam("pageNum", "1")
				.queryParam("amount", "20"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

	@Disabled
	@Test
	void testGetWeeklyData() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/api/vendor/salesdata/21"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}

//	@Disabled
	@Test
	void testGetTotalData() throws Exception {
		mockMvc.perform(MockMvcRequestBuilders.get("/api/vendor/total/21"))
			   .andExpect(MockMvcResultMatchers.status().isOk())
			   .andDo(print());	
		}
	
	
}