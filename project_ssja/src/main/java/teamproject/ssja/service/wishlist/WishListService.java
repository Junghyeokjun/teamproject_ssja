package teamproject.ssja.service.wishlist;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.WishListDTO;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.mapper.WishListMapper;

@Service
public class WishListService {

	@Autowired
	private  WishListMapper wishListMapper;
	
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
