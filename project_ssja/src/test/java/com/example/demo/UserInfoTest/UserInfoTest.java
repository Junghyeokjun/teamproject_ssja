package com.example.demo.UserInfoTest;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.ProjectSsjaApplication;
import teamproject.ssja.dto.AddressForm;
import teamproject.ssja.dto.ChangePasswordForm;
import teamproject.ssja.dto.UserInfoDTO;
import teamproject.ssja.service.mypage.MyPageService;
import teamproject.ssja.service.user.CustomUserDetailsService;

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
	@Test
	@DisplayName("비밀번호 변경 테스트")
	void changePasswordTest() {
		
		
		ChangePasswordForm form = new ChangePasswordForm("1234", "1111");
		Boolean check=userService.changePasswordProcess("testlogin1", form);
		
		
		Assertions.assertThat(check).isEqualTo(true);
	}

}
