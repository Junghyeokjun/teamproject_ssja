package teamproject.ssja.controller.adminpage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.ssja.LoginChecker;

@Controller
@RequestMapping("/adminPage")
public class AdminPageController {
	
	@RequestMapping("/AdminPage")
	public String adminPage() {
		return "AdminPage";
	
	}
		
}
