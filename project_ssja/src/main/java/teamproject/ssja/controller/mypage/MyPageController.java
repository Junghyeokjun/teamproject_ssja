package teamproject.ssja.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.ssja.LoginChecker;


@Controller
@RequestMapping("/myPage")
public class MyPageController {

	
	@GetMapping("")
	public String myPageP(Model model ) {
		int loginMethod = LoginChecker.check();
		
		//로그인 O, 소셜 로그인일 경우 if
		 if (loginMethod == 2) {
			 
			
	            return "/myPage/rejectMyPage";
	            
	         //로그인 O, 세션로그인일 겨우 -> 소셜로그인아 아닌 if  
		 }else if(loginMethod == 1){
			 
			 return "/myPage/MyPage";
		 }
		 
		 //둘 다 아닌 -> 로그인 X, 인증하지 않음

		 return "redirect:/login";
	}
	
	@GetMapping("/password/check")
	public String pwCheckP() {
		return "";
	}
	
	@RequestMapping("/password/change")
	public String pwChangeP() {
		return "/myPage/changePassWord";
	}

}
