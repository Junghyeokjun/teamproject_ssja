package teamproject.ssja.service.wishlist;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.WishListDTO;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.mapper.WishListMapper;

@SpringBootTest
@Slf4j
class WishListServiceTest {

	@Autowired
	WishListMapper wishListMapper;

	@Disabled
	@Test
	void test() {

	WishListDTO a = wishListMapper.checkSelected(1, 1);
		Assertions.assertThat(a.getCountWish()).isEqualTo(1);
		Assertions.assertThat(a.getPro_wish()).isEqualTo(20);
		
	}
	
	

}
