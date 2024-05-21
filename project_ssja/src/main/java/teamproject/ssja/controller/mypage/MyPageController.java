package teamproject.ssja.controller.mypage;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/myPage")
public class MyPageController {

	
	@GetMapping("")
	public String myPageP() {
		return "MyPage";
	}
	
	@GetMapping("/password/check")
	public String pwCheckP() {
		return "";
	}
	
	@RequestMapping("/password/change")
	public String pwChangeP() {
		return "changePassWord";
	}

}
