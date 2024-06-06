package teamproject.ssja.service.wishlist;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.WishListDTO;
import teamproject.ssja.mapper.WishListMapper;

@Service
public class WishListService {

	@Autowired
	private  WishListMapper wishListMapper;
	
	public int changeWish(long memberNum, Long productNum) {
		Map<String, Long> params = new HashMap<>();
		params.put("memberNum", memberNum);
		params.put("productNum", productNum);
		
		WishListDTO selectedWish = wishListMapper.checkSelected(params);
		
		int count_wish = selectedWish.getPro_wish();
		if(selectedWish.getCountWish() >= 1) {
			wishListMapper.removeWishList(params);
			wishListMapper.minusWishProduct(productNum);
			return count_wish - 1;
		}else {
			
			wishListMapper.addWishList(params);
			wishListMapper.plusWishProduct(productNum);
			return count_wish + 1;
		}
	}
	
	
	
}
