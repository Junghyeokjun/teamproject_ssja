package teamproject.ssja.controller;

import static org.assertj.core.api.Assertions.*;

import org.hamcrest.core.IsInstanceOf;
import org.junit.jupiter.api.Test;
import org.junit.platform.commons.annotation.Testable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpServletResponse;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;

import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.service.Admin.AdminInfoListService;
import teamproject.ssja.service.Admin.CouponListService;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Admin.PurchaseListService;
import teamproject.ssja.service.Admin.QnaListService;
import teamproject.ssja.service.Admin.SalesListService;
import teamproject.ssja.service.Product.ProductCategoryService;
import teamproject.ssja.service.Vendor.VendorService;
import teamproject.ssja.service.user.CustomUserDetailsService;
import java.util.*;

@SpringBootTest
@Slf4j
@Transactional
@AutoConfigureMockMvc
public class AdminControllerTest {

	@Autowired
	MockMvc mockMvc;
	@Autowired
	CustomUserDetailsService customUserDetailsService;
	@Autowired
	private ObjectMapper objectMapper;

	@Test
	@WithUserDetails(value = "test1", userDetailsServiceBeanName = "customUserDetail")
	void testUnAuthorizedForbidden() throws Exception {
		mockMvc.perform(get("/adminPage")).andExpect(status().isForbidden());
	}

	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testAddProduct() throws Exception {
		MvcResult resultAdmin = mockMvc.perform(get("/adminPage"))
				.andExpect(status().isOk()).andReturn();

		ModelAndView mv = resultAdmin.getModelAndView();
		Map<String, Object> model = mv.getModel();
		assertNotNull(model.get("dailyPrice"));
		assertNotNull(model.get("dailyPurcount"));
		assertNotNull(model.get("dailyMCount"));
		assertNotNull(model.get("dailyQnaCount"));
		assertNotNull(model.get("dailySales"));
		assertNotNull(model.get("dailyMCounts"));
		assertNotNull(model.get("dailyVCounts"));

		List<Map<String, Object>> dailySales = (List<Map<String, Object>>) model.get("dailySales");
		assertThat(dailySales.size() > 0).isTrue();

		assertThat(mv.getViewName()).isEqualTo("/adminPage/AdminPage");
	}

	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testGetDailyPurList() throws Exception {
		MvcResult mvcResult = mockMvc.perform(get("/adminPage/dailyPurList")).andExpect(status().isOk()).andReturn();

		String jsonResponse = mvcResult.getResponse().getContentAsString();

		List<PurchaseDto> purchaseDtoList = objectMapper.readValue(jsonResponse,
				new TypeReference<List<PurchaseDto>>() {
				});

		assertNotNull(purchaseDtoList);
		assertThat(purchaseDtoList.isEmpty()).isTrue();
	}

	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testgetDailyMList() throws Exception {
		MvcResult mvcResult = mockMvc.perform(get("/adminPage/dailyMList"))
				.andExpect(status().isOk()).andReturn();

		String jsonResponse = mvcResult.getResponse().getContentAsString();

		List<MembersDto> resultList = objectMapper.readValue(jsonResponse, 
				new TypeReference<List<MembersDto>>() {});

		assertNotNull(resultList);
		assertThat(resultList.isEmpty()).isFalse();
	}

	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testgetDailyQnaList() throws Exception {
		MvcResult mvcResult = mockMvc.perform(get("/adminPage/dailyQnaList"))
				.andExpect(status().isOk()).andReturn();

		String jsonResponse = mvcResult.getResponse().getContentAsString();

		List<QnaBoardDto> resultList = objectMapper.readValue(jsonResponse, 
				new TypeReference<List<QnaBoardDto>>() {});

		assertNotNull(resultList);
		assertThat(resultList.isEmpty()).isTrue();
	}
	
	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testProductListPage() throws Exception {
		MvcResult mvcResult = mockMvc.perform(get("/adminPage/productsList"))
				.andExpect(status().isOk()).andReturn();

		ModelAndView resultMV=mvcResult.getModelAndView();
		
		Map<String, Object> model = resultMV.getModel();
		String viewName = resultMV.getViewName();
		assertThat(viewName).isEqualTo("/adminPage/productsList");
		
		long totalCountProd = productListService.getProductListTotalCount();
		assertThat(totalCountProd).isNotNull();
		
	}
	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testProductSearch() throws Exception {
		MvcResult mvcResult = mockMvc.perform(get("/adminPage/productsSearchList")
				.param("type","PRO_BIZNAME")
				.param("keyword","SSJA"))
		.andExpect(status().isOk())
		.andReturn();
		String jsonResponse = mvcResult.getResponse().getContentAsString();
		List<ProductsSearchDto> resultList = objectMapper.readValue(jsonResponse, 
				new TypeReference<List<ProductsSearchDto>>() {});
		assertThat(resultList.isEmpty()).isFalse();
		assertThat(resultList.get(0) instanceof ProductsSearchDto).isTrue();
		
		
		}
	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testProductSearchNonExistVendor() throws Exception {
		MvcResult mvcResult = mockMvc.perform(get("/adminPage/productsSearchList")
				.param("type","PRO_BIZNAME")
				.param("keyword","qweqwe"))
		.andExpect(status().isOk())
		.andReturn();
		String jsonResponse = mvcResult.getResponse().getContentAsString();
		List<ProductsSearchDto> resultList = objectMapper.readValue(jsonResponse, 
				new TypeReference<List<ProductsSearchDto>>() {});
		assertThat(resultList.isEmpty()).isTrue();
		
		
		}
	
	@Test
	@WithUserDetails(value = "testadmin", userDetailsServiceBeanName = "customUserDetail")
	void testCouponControll() throws Exception {
		Criteria criteria = new Criteria();
		
		MvcResult mvcResult = mockMvc.perform(get("/adminPage/couponsList"))
		.andExpect(status().isOk())
		.andReturn();
		ModelAndView resultMV = mvcResult.getModelAndView();
		String viewName = resultMV.getViewName();
		assertThat(viewName).isEqualTo("/adminPage/couponsList");
		
		Map<String , Object> model = resultMV.getModel();
		List<CouponDTO> currCoupons =(List<CouponDTO>) model.get("coupons");
		assertThat(currCoupons.size()).isNotNull().isNotEqualTo(0);
		assertThat(currCoupons.isEmpty()).isFalse();
		
		long currCouponCount = couponListService.getCouponListTotalCount();
		
		CouponDTO newCoupon = new CouponDTO();
		newCoupon.setC_name("제이유닛쿠폰");
		newCoupon.setC_dcper(12);
		newCoupon.setC_startdate(new Dat);
		
		couponListService.addCoupon(newCoupon);
		
		long renewCouponCount = couponListService.getCouponListTotalCount();
		
		assertThat(currCouponCount).isEqualTo(renewCouponCount);
		assertThat(currCouponCount + 1).isEqualTo(renewCouponCount);
	}

	@Autowired
	private AdminInfoListService adminInfoListService;

	@Autowired
	private MemberListService memberListService;

	@Autowired
	private ProductListService productListService;

	@Autowired
	private PurchaseListService purchaseListService;

	@Autowired
	private CouponListService couponListService;

	@Autowired
	private SalesListService salesListService;

	@Autowired
	private QnaListService qnaListService;

	@Autowired
	ProductCategoryService productCategoryService;

	@Autowired
	VendorService vendorService;

}
