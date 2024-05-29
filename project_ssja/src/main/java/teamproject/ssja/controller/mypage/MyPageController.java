package teamproject.ssja.controller.mypage;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import teamproject.ssja.dto.logindto.CustomPrincipal;


@Controller
@RequestMapping("/myPage")
public class MyPageController {

	
	@GetMapping("")
	public String myPageP(@AuthenticationPrincipal CustomPrincipal user,Model model ) {
		
		long m_no = user.getMemberNum(); //회원 테이블  M_NO꺼내기 소셜, 세션  방법 동일
		String userEmail = user.getEmail(); // 이메일 꺼내기 방법 동일
		
		
		//로그인 O, 소셜 로그인일 경우 if
		 if (user != null && user.isOAuth2User()) {
			 
			
	            return "/myPage/rejectMyPage";
	            
	         //로그인 O, 세션로그인일 겨우 -> 소셜로그인아 아닌 if  
		 }else if(user != null && !user.isOAuth2User()){
			 
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
