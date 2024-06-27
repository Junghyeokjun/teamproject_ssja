package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.exceptions.TooManyResultsException;
import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.dto.product.ProductNumberDTO;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
@Slf4j
@SpringBootTest
class MyPageMapperTest {
	
	@Autowired
	MyPageMapper myPageMapper;
	@Autowired
	BoardMapper boardMapper;
	
	////@Disabled
	@Test
	@DisplayName("총 개수 장바구니 테스트")
	void getTotalTest() {
		int num = myPageMapper.getTotalCartItems(1);
		Assertions.assertThat(num).isNotEqualTo(0);
	}
	////@Disabled
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
	////@Disabled
	@Test
	@DisplayName("장바구니 사유품 삭제 테스트")
	void testDeleteItemFromCart() {
		List<Integer> list = Arrays.asList(3455,1234);
		long id = 1;
		ProductNumberDTO data = new ProductNumberDTO(id,list);
		myPageMapper.deleteCartItem(data);
		}
	
	@Test
	void 내가쓴글공지테스트() {
		List<BoardDto> list = boardMapper.getMyQnAs(1L, 1);
		
		log.info("1 {}",list.get(0));
	}
	
	@Test
	void 내가쓴글코뮤테스트() {
		List<CommunityBoardDto> list = boardMapper.getMyCommus(1L, 1);
		assertNotNull(list);
		//log.info("1 {}",list.get(0));
		log.info("result List : {}", list);
		int size = 0;
		if(list == null || list.isEmpty()) {
			size = 0;
		
		}else {
			size = list.size();
		}
		log.info("result list size : {}",size);
	}
	

}
