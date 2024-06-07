package teamproject.ssja.service.Product;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
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
	@DisplayName("장바구니 데이터 테스트")
	void itemsCart() {
		List<CartItemsDTO> list = mapper.getYourItemCrat(1);
		assertNotNull(list);
		for(CartItemsDTO d : list) {
			
		log.info("item {}",d);	
		}
	}

}
