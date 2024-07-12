package teamproject.ssja.service.Vendor;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.Collection;
import java.util.Map;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.vendor.VendorItemCondition;
import teamproject.ssja.page.Criteria;

@Slf4j
@SpringBootTest
class VendorServiceImplTest3 {

	@Autowired
	VendorService vendorService;
	
	@Disabled
	@Test
	void notNullTest() {
		assertNotNull(vendorService);
	}

	@Disabled
	@Test
	void getProNumTest() {
		ProductDto product=new ProductDto();
		product.setPRO_BANNERIMG("/home/ubuntu/images/product_banner/banner_1.jpg");
		product.setPRO_QUANTITY(111);
		product.setPRO_PRICE(1111);
		product.setV_NO(21);
		product.setPRO_NAME("test");
		log.info(vendorService.getProNum(product)+"");
	}

	@Disabled
	@Test
	void isEmptyTest() {
		log.info(vendorService.isEmpty(null,null,null,new Model() {
			
			@Override
			public Model mergeAttributes(Map<String, ?> attributes) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Object getAttribute(String attributeName) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public boolean containsAttribute(String attributeName) {
				// TODO Auto-generated method stub
				return false;
			}
			
			@Override
			public Map<String, Object> asMap() {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAttribute(String attributeName, Object attributeValue) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAttribute(Object attributeValue) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAllAttributes(Map<String, ?> attributes) {
				// TODO Auto-generated method stub
				return null;
			}
			
			@Override
			public Model addAllAttributes(Collection<?> attributeValues) {
				// TODO Auto-generated method stub
				return null;
			}
		})+"");
	}
	
	@Disabled
	@Test
	void getQnaListsTest() {
		Criteria criteria= new Criteria();
		
		log.info(vendorService.getQnaLists(criteria, 21L, 21L)+"");
		log.info(criteria+"");
	}
	@Disabled
	@Test
	void getProductListTest() {
		Criteria criteria= new Criteria();
		
		log.info(vendorService.getProductList(criteria, 21L)+"");
	}
	@Disabled
	@Test
	void getQnaCountsTest() {
		Criteria criteria= new Criteria();
		
		log.info(vendorService.getQnaCounts(criteria)+"");
	}

	@Disabled
	@Test
	void getProductCountsTest() {
		Criteria criteria= new Criteria();
		
		log.info(vendorService.getProductCounts(criteria)+"");
	}
	
	@Disabled
	@Test
	void getVendorTotalInfoTest() {
		
		log.info(vendorService.getVendorTotalInfo("SSJA",1)+"");
	}
	
	@Disabled
	@Test
	void getVendorItemListTest() {
		VendorItemCondition conditon= new VendorItemCondition();
		conditon.setBizname("SSJA");
		conditon.setOrder("null");
		conditon.setStart(0);
		conditon.setEnd(2);
		conditon.setPageNum(1);
		
		log.info(vendorService.getVendorItemList(conditon)+"");
	}

	@Disabled
	@Test
	void getWeeklySalesDataTest() {
		
		log.info(vendorService.getWeeklySalesData(21)+"");
	}

	@Disabled
	@Test
	void getTotalSalesDataTest() {

		
		log.info(vendorService.getTotalSalesData(21)+"");
	}

	@Disabled
	@Test
	void getQnaSearchListsTest() {
		Criteria criteria= new Criteria();
		criteria.setBcno(31);
		criteria.setBmno(21);
		
		log.info(vendorService.getQnaSearchLists(criteria,"content","")+"");
	}

	@Disabled
	@Test
	void getThisProductTest() {
		
		log.info(vendorService.getThisProduct(4081)+"");
	}

	@Disabled
	@Test
	void modifyProductTest() {
		ProductDto product= new ProductDto();
		product.setP_C_NO(31);
		product.setPRO_PRICE(12000);
		product.setPRO_NAME("test");
		product.setPRO_NO(4081);
		vendorService.modifyProduct(product);
	}
	
	@Disabled
	@Test
	void getSearchProductsTest() {
		Criteria criteria= new Criteria();
		criteria.setVno(21);
		
		log.info(vendorService.getSearchProducts(criteria,"proName","")+"");
	}

	@Disabled
	@Test
	void getSearchProductsCountTest() {
		Criteria criteria= new Criteria();
		criteria.setVno(21);
		
		log.info(vendorService.getSearchProductsCount(criteria,"proName","")+"");
	}
}
