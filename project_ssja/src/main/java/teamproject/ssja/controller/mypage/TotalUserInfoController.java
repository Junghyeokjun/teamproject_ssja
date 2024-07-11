package teamproject.ssja.controller.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.page.ListObjectPaging5DTO;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.service.mypage.TotalInfoMyPageService;

@Slf4j
@RestController
@RequestMapping("/user-info/total")
public class TotalUserInfoController {
	
	@Autowired
	TotalInfoMyPageService totalService;
	
	
	@PostMapping("/order")
	public ResponseEntity<ListObjectPagingDTO> getTotalOrderInfo(@RequestParam int pageNum){
		ListObjectPagingDTO data = totalService.getInfoOrders(pageNum);
		
		return ResponseEntity.ok(data);
	}
	
	@PostMapping("/wish")
	public ResponseEntity<ListObjectPaging5DTO> getTotalWishInfo(@RequestParam int pageNum){
		ListObjectPaging5DTO data = totalService.getInfoWish(pageNum);

		return ResponseEntity.ok(data);
	}
	@PostMapping("/point")
	public ResponseEntity<ListObjectPaging5DTO> getTotalPointInfo(@RequestParam int pageNum){
		
		ListObjectPaging5DTO data = totalService.getInfoPoint(pageNum);
		
		return ResponseEntity.ok(data);
	}
	@PostMapping("/coupon")
	public ResponseEntity<ListObjectPagingDTO> getTotalPointInfo(@RequestParam int pageNum, @RequestParam String condition){
		//("pagenum {}, ordered {}", pageNum, condition);
		ListObjectPagingDTO data = totalService.getMyCouponInfo(pageNum,condition);
		
		return ResponseEntity.ok(data);
	}
	


}
