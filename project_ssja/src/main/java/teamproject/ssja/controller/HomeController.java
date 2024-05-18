package teamproject.ssja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	@RequestMapping("/login")
	public String login() {
		
		return "temp_login";
	}
	@RequestMapping("/home")
	public String goHomePage() {
		
		return "index";
	}

}
