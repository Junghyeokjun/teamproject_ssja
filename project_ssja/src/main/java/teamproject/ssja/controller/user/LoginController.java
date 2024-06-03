package teamproject.ssja.controller.user;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	
	
	
	@RequestMapping("/login")
	public String login(RedirectAttributes attr) {
		
			
		return "temp_login";
		
	}
	
	


}
