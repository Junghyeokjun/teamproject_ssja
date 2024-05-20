package com.example.demo.UserInfoTest;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.ProjectSsjaApplication;
import teamproject.ssja.dto.UserInfoDTO;
import teamproject.ssja.service.mypage.MyPageService;

@Slf4j
@SpringBootTest(classes = ProjectSsjaApplication.class)
public class UserInfoTest {
	
	@Autowired
	MyPageService myPageService;
	
	
	@Test
	@DisplayName("마이 페이지 유저정보 불러오기 확인 테스트")
	void UserInfoGetTest() {
		UserInfoDTO userInfo = myPageService.getUserInfo("testlogin");
		log.info("userInfo = {}", userInfo);
		Assertions.assertThat(userInfo.getM_Name()).isEqualTo("tester");
	}

}
