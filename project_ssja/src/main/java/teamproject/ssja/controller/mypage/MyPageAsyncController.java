package teamproject.ssja.controller.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.UserInfoDTO;
import teamproject.ssja.service.mypage.MyPageService;
@Slf4j
@RestController
@RequestMapping("/myPage")
public class MyPageAsyncController {
	
	@Autowired
	MyPageService myPageService;
	
	
	@PostMapping("/user")
	public UserInfoDTO myPageUser(@AuthenticationPrincipal UserDetails userDetails) {
		String userId = userDetails.getUsername();
				UserInfoDTO userInfo = myPageService.getUserInfo(userId);
				
				log.info("transfer UserInfo.. {}", userInfo);
				return userInfo;
		
		
		
	}

}
