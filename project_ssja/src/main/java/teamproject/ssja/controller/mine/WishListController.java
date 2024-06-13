package teamproject.ssja.controller.mine;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.service.Product.ProductService;
import teamproject.ssja.service.wishlist.WishListService;

@Slf4j
@RestController
@RequestMapping("/wishlist")
@RequiredArgsConstructor
public class WishListController {

	private final WishListService wishListService;
	
	
	@PatchMapping("")
	public ResponseEntity<Integer> changWishOfItem(@RequestBody Map<String, Object> data, @AuthenticationPrincipal CustomPrincipal user){
		log.info("data {}",data);
		long memberNum = user.getMemberNum();
		Long itemNum = ((Integer) data.get("pro_no")).longValue();
		int wishCount = wishListService.changeWish(memberNum, itemNum);
		
		return ResponseEntity.ok(wishCount);
	}
	
	@DeleteMapping("")
	public ResponseEntity<String> deleteWish(@RequestParam("productNum") int productNum){
		wishListService.deleteWish(productNum);
		return ResponseEntity.ok("success");
	}
}
