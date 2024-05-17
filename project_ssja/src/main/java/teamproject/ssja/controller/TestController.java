package teamproject.ssja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestController {
	
	
	@RequestMapping("sign_up_before")
	public String signUpBefore() {
		return "sign_up_terms";
	}
	@RequestMapping("sign_up")
	public String signUp() {
		return "sign_up";
	}
	

}
