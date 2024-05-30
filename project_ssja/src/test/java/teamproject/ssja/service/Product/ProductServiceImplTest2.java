package teamproject.ssja.service.Product;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.product.ProductItemDto;

@SpringBootTest
@Slf4j
class ProductServiceImplTest2 {

	@Autowired
	ProductService ProductService;
	
	@Test
	@DisplayName("메인 페이지 상품 리스트 조회")
	void test() {
		
		List<ProductItemDto> list = ProductService.bestItemsList(1);
		Assertions.assertThat(list.size()).isEqualByComparingTo(20);
		for(ProductItemDto a : list) {
			log.info("상품 베슽 {}",a);
		}
		
	}

}
