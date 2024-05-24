package teamproject.ssja.service.mypage;

import static org.junit.jupiter.api.Assertions.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
@SpringBootTest
@Slf4j
@Transactional
class MyPageUserInfoServiceTest {
	
	@Autowired
	MyPageService myPageService;
	

//@Disabled
	@Test
	@DisplayName(" 이메일 변경 테스트")
	void modifyEmailTest() {
		String username="testlogin";
		String email = "1234@1233.com";
		
		myPageService.modifyUserEmail(email, username);
		
		UserInfoDTO user = myPageService.getUserInfo(1);
		Assertions.assertThat(user.getM_Email()).isEqualTo(email);
		
	}
}
