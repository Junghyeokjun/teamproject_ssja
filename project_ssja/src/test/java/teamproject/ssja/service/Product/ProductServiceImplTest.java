package teamproject.ssja.service.Product;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;

@Slf4j
@SpringBootTest
class ProductServiceImplTest {

	@Autowired
	ProductService productService;
	
	@Test
	@DisplayName("상품 리스트 db접근 테스트")
	void testProductList() {
		
		List<ProductDto> list = productService.getProductList();
		
		
		assertNotNull(list);
		
	}

}
