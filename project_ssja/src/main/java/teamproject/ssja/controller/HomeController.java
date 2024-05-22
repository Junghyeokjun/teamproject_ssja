package teamproject.ssja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
