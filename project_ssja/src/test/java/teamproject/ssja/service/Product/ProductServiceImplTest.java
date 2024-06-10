package teamproject.ssja.service.Product;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductItemDto;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.mapper.ProductListMapper;

@Slf4j
@SpringBootTest
class ProductServiceImplTest {

	@Autowired
	ProductService productService;
	@Autowired
	ProductListMapper mapper;
	
	@Test
	@Disabled
	@DisplayName("장바구니 데이터 테스트")
	void itemsCart() {
		List<CartItemsDTO> list = mapper.getYourItemCrat(1);
		assertNotNull(list);
		for(CartItemsDTO d : list) {
			
		log.info("item {}",d);	
		}
	}
	@Test
	@DisplayName("메인페이지 카테고리 상품 리스")
	void 메인카테고리상품() {
		List<ProductItemDto> list = productService.getCategoryItems(1, 1);
		Assertions.assertThat(list.size()).isNotIn(0);
		log.info("list{}", list);
	}

}
