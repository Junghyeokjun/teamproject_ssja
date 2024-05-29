package teamproject.ssja.service.wishlist;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.dto.WishListDTO;
import teamproject.ssja.mapper.WishListMapper;

@Service
@RequiredArgsConstructor
public class WishListService {

	
	private final WishListMapper wishListMapper;
	
	public int changeWish(long memberNum, Integer productNum) {
		
		WishListDTO selectedWish = wishListMapper.checkSelected(memberNum, productNum);
		
		int count_wish = selectedWish.getPro_wish();
		if(selectedWish.getCountWish() >= 1) {
			wishListMapper.removeWishList(memberNum, productNum);
			wishListMapper.minusWishProduct(productNum);
			return count_wish - 1;
		}else {
			
			wishListMapper.addWishList(memberNum, productNum);
			wishListMapper.plusWishProduct(productNum);
			return count_wish + 1;
		}
	}
	
}
