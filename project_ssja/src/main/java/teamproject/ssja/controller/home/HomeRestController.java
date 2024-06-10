package teamproject.ssja.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.mainpage.MainPageDTO;
import teamproject.ssja.service.mainpage.MainPageService;

@RestController
@Slf4j
public class HomeRestController {

	@Autowired
	MainPageService mainPageService;

	@GetMapping("/home/event-banners")
	public ResponseEntity<?> eventTrans() {

			return ResponseEntity.ok("success");


	}
	@GetMapping("/home/mainpage/data")
	public ResponseEntity<MainPageDTO> mainPageData(@RequestParam("bestPageNum")int bestPageNum){
		log.info("bestPageNum {}", bestPageNum);
		MainPageDTO data = mainPageService.getMainPageData(bestPageNum);
		
		return ResponseEntity.ok(data);
	}
	
	
	

//	@PostMapping("/logout")
//	public ResponseEntity<String> logoutProcess() {
//		ResponseEntity<String> entity = null;
//		try {
//			log.info("로그아웃 통신 확인");
//			entity = new ResponseEntity<String>("success", HttpStatus.OK);
//
//		} catch (Exception e) {
//			log.info("실패");
//			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
//		}
//		return entity;
//	}

}


