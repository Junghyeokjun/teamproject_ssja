package teamproject.ssja.controller.home;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	
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
		
		if(eventNum == 0) return "sign_up_terms";
			
		
		model.addAttribute("eventNum",eventNum);
		
		return "event_page";
	}
	

}
