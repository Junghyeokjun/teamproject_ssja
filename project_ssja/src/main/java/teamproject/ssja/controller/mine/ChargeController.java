package teamproject.ssja.controller.mine;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.service.charge.ChargeService;


@Slf4j
@RequestMapping("/charge")
@Controller
@RequiredArgsConstructor
public class ChargeController {
	
	private final ChargeService chargeService;
	
	
	
	@GetMapping("point")
	public String chargePoint() {
		
		
		return "/myPage/chargePoint";
	}
	
	@ResponseBody
	@GetMapping("/user/point")
	public ResponseEntity<?> chargeUserPointP(@RequestParam("amount") Long point){
		try {
			
		log.info("충전 금액 : {}", point);
		long id = InfoProvider.getM_NO();
		
		chargeService.chargePoint(id, point);
		
		return ResponseEntity.ok("sueccess");
		}catch(Exception e) {
			return ResponseEntity.badRequest().body("failed");
		}
	}

}
