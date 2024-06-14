package teamproject.ssja.service.Product;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.product.ProductDetailTotalInfoDTO;
import teamproject.ssja.dto.product.ProductImgDTO;
import teamproject.ssja.page.ListObjectPagingDTO;

@Slf4j
@SpringBootTest
class ProductDetailServiceImplTest {
	
	@Autowired
	ProductDetailService ProductService;

	@Test
	void test() {
		
		Long productNum = 3081L;
		ProductDetailTotalInfoDTO data = ProductService.getProductDetailInfo(productNum);
		
		assertNotNull(data);
		
	}
	@Test
	void 상품상세리뷰테슽트() {
		Long productNum = 3081L;
		ListObjectPagingDTO rvdata = ProductService.getItemsReview(productNum, 1);
		log.info("data {}", rvdata);
		assertNotNull(rvdata);
	}
}
