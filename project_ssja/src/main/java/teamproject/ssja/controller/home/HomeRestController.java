package teamproject.ssja.controller.home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.event.EventInfoDTO;
import teamproject.ssja.mapper.EventMapper;

@RestController
@Slf4j
public class HomeRestController {

	@Autowired
	EventMapper eventMapper;
	
	@GetMapping("/home/event-banners")
	public ResponseEntity<?> eventTrans(){
		try {
			
			List<EventInfoDTO> eventList = eventMapper.getEventList();
			
			return  ResponseEntity.ok(eventList);
			
		} catch (Exception e) {
		}
		return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("실패");
		
	}
}
