package teamproject.ssja.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.LoginChecker;

@Slf4j
@Controller
@RequestMapping("/myPage")
public class MyPageController {

	
	@GetMapping("")
	public String myPageP(Model model ) {
		
//		if(InfoProvider.userAuth().equals("ROLE_ADMIN")) {
//	         return "/adminPage";
//	      }
//		
		
		int loginMethod = LoginChecker.check();
		
		//로그인 O, 소셜 로그인만 하는 회원
		 if (loginMethod == 2) {//2반환
	            return "/myPage/rejectMyPage";
	            
	         //로그인 O, 회원 등록된 일반회원 및 소셜로그인 후 회원으로 등록한 회원
		 }else if(loginMethod == 1){//1반환
			 return "/myPage/MyPage";
		 }
		 
		 //둘 다 아닌 -> 로그인 X, 인증하지 않음
		 return "redirect:/login";
	}
	
	@GetMapping("/orderInfo")
	public String myOrderP() {
		
	return "/myPage/MyPage";
	}
	
	@GetMapping("/password/check")
	public String pwCheckP() {
		return "";
	}
	
	@RequestMapping("/password/change")
	public String pwChangeP() {
		return "/myPage/changePassWord";
	}
	
	@GetMapping("/cart")
	public String myCartP() {
		return "/product/myCart";
	}
	
	@GetMapping("/apply/vendor")
	public String pageToApplyV() {
		return "/myPage/MyPage";
	}
}
