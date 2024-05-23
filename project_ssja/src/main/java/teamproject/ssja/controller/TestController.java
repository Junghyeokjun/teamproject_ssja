package teamproject.ssja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {
	
	@RequestMapping("/sign_up_before")
	public String signUpBefore() {
		return "sign_up_terms";
	}
	@RequestMapping("/sign_up")
	public String signUp() {
		return "sign_up";
	}
	
	@RequestMapping("/listpage")
	public String listpage() {
		return "temp_listpage";
	}
	@RequestMapping("/login")
	public String login() {
		return "temp_login";
	}
	@RequestMapping("/purchase")
	public String purchase() {
		return "purchase";
	}

}
