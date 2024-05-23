package teamproject.ssja.controller.home;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.event.EventPageDTO;
import teamproject.ssja.mapper.EventMapper;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	EventMapper eventMapper;
	
	
	@RequestMapping("/home")
	public String goHomePage() {
		
		return "index";
	}
	
	@RequestMapping("/logout")
	public String logoutP() {
		return "redirect:/";
	}
	
	@GetMapping("/event/page")
	public String eventP(@RequestParam("event") int eventNum,Model model) {
		
		if(eventNum <= 0) return "sign_up_terms";
			
		
		EventPageDTO evPageInfo = eventMapper.getEventInfoToPage(eventNum);
		model.addAttribute("evPageInfo",evPageInfo);
		
		return "/event/event_page";
	}
	
	@RequestMapping("/link_source")
	public String linkSourceP() {
		
		
		return "/event/link_source";
	}
	

}
