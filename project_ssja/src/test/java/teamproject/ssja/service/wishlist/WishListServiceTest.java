package teamproject.ssja.service.wishlist;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.dto.WishListDTO;
import teamproject.ssja.mapper.WishListMapper;

@SpringBootTest

class WishListServiceTest {

	@Autowired
	WishListMapper wishListMapper;

	@Test
	void test() {

	WishListDTO a = wishListMapper.checkSelected(1, 1);
		Assertions.assertThat(a.getCountWish()).isEqualTo(1);
		Assertions.assertThat(a.getPro_wish()).isEqualTo(20);
		
	}

}
