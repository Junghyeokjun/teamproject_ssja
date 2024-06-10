package teamproject.ssja.mapper;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.product.ProductNumberDTO;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
@Slf4j
@SpringBootTest
class MyPageMapperTest {
	
	@Autowired
	MyPageMapper myPageMapper;
	
	@Disabled
	@Test
	@DisplayName("총 개수 장바구니 테스트")
	void getTotalTest() {
		int num = myPageMapper.getTotalCartItems(1);
		Assertions.assertThat(num).isEqualTo(8);
	}
	@Disabled
	@Test
	@DisplayName("장바구니 데이터 테스트")
	void getItemsTest() {
		
		Map<String, Long> params = new HashMap<>();
		params.put("pageNum",(long) 1);
		params.put("m_no",(long) 1);
		List<CartItemsDTO> list =myPageMapper.getMyCartItems(params);
		for(CartItemsDTO c : list) {
			log.info("item {}", c);
		}
	}
	@Test
	@DisplayName("장바구니 사유품 삭제 테스트")
	void testDeleteItemFromCart() {
		List<Integer> list = Arrays.asList(3455,1234);
		long id = 1;
		ProductNumberDTO data = new ProductNumberDTO(id,list);
		myPageMapper.deleteCartItem(data);
		}

}
