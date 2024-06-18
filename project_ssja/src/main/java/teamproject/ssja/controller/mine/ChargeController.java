package teamproject.ssja.controller.mine;

import org.springframework.http.HttpStatus;
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
			
		long id = InfoProvider.getM_NO();
		Long amount = point+ Math.round(point * 2.0 / 100.0);
		chargeService.chargePoint(id, amount);
		
		return ResponseEntity.ok("sueccess");
		}catch(Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(e);
		}
	}
	
	@GetMapping("/success")
	public String successChargeP() {
		
		return "/myPage/successCharge";
	}

}
