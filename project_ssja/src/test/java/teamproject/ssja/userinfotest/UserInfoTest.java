package teamproject.ssja.userinfotest;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.ProjectSsjaApplication;
import teamproject.ssja.dto.AddressForm;
import teamproject.ssja.dto.ChangePasswordForm;
import teamproject.ssja.dto.UserInfoDTO;
import teamproject.ssja.service.mypage.MyPageService;
import teamproject.ssja.service.user.CustomUserDetailsService;
@Transactional
@Slf4j
@SpringBootTest(classes = ProjectSsjaApplication.class)
public class UserInfoTest {
	
	@Autowired
	MyPageService myPageService;
	@Autowired
	CustomUserDetailsService userService;
	
	
	@Test
	@Disabled
	@DisplayName("마이 페이지 유저정보 불러오기 확인 테스트")
	void UserInfoGetTest() {
		UserInfoDTO userInfo = myPageService.getUserInfo(2);
		log.info("userInfo = {}", userInfo);
		Assertions.assertThat(userInfo.getM_Name()).isEqualTo("tester");
	}
	@Disabled
	@Test
	@DisplayName("유저 배송지 변경 테스트")
	void addressChangTest() {
		AddressForm address = new AddressForm("123","qwe","asd",1);
		
		myPageService.changeAddress(address);
		
	}
	
	@Disabled
	@Test
	@DisplayName("비밀번호 변경 테스트")
	void changePasswordTest() {
		
		
		ChangePasswordForm form = new ChangePasswordForm("1234", "1111");
		Boolean check=userService.changePasswordProcess("testlogin1", form);
		
		
		Assertions.assertThat(check).isEqualTo(true);
	}
	@Disabled
	@Test
	@DisplayName("탈퇴 신청 날짜 등록 테스트")
	void userDeletecheckTest() {
		String deletedate = myPageService.deleteUserEnroll("testlogin1");
		LocalDate today = LocalDate.now();
		
		LocalDate EnrollDeleteDate = today.plusDays(7);
		
		DateTimeFormatter formatString = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		 String EnrollDelDate = EnrollDeleteDate.format(formatString);
		 
			 
		 Assertions.assertThat(EnrollDelDate).isEqualTo(deletedate);

	}
	@Disabled
	@Test
	@DisplayName("탈퇴 신청 날짜 등록 유저 삭제테스트")
	void deleteEnrolledUserTest() {
		myPageService.deleteEnrolled();
		
	}
	//@Disabled
	@Test
	@DisplayName("탈퇴 유보 기간 지난 유저 삭제 프로세스 테스트")
	void deleteEnrolledUserProcessTest() {
		List<String> enrolledDeleteUsers = myPageService.findDeleteEnrolledUsers();
		
		log.info("asdas {} ",enrolledDeleteUsers);
		if(enrolledDeleteUsers.size() > 0) {
			log.info("리스트 있음 실행도미 길이 {} ",enrolledDeleteUsers.size());
			myPageService.deleteEnrolledUsersAuth(enrolledDeleteUsers);
			
			myPageService.deleteEnrolled();
		}
	}

}
