package teamproject.ssja.controller.wishlist;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.logindto.CustomPrincipal;
import teamproject.ssja.service.wishlist.WishListService;

@Slf4j
@RestController
@RequestMapping("/wishlist")
@RequiredArgsConstructor
public class WishListController {

	private final WishListService wishListService;
	
	@PutMapping("")
	public ResponseEntity<Integer> changWishOfItem(@RequestBody Map<String, Object> data, @AuthenticationPrincipal CustomPrincipal user){
		
		log.info("data {}",data);
		long memberNum = user.getMemberNum();
		Integer itemNum = (Integer)data.get("pro_no");
		int wishCount = wishListService.changeWish(memberNum, itemNum);
		
		return ResponseEntity.ok(wishCount);
	}
}
