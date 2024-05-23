package teamproject.ssja.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.service.signup.SignUpService;

@Slf4j
@SpringBootTest
class TestServiceImplTest {

	@Autowired
	SignUpService signUpService;
	
	@Disabled
	@Test
	void test() {
		assertNotNull(signUpService);
	}

	@Disabled
	@Test
	void testIdCheck() {
		log.info(signUpService.idCheck("testUser1")+"");
	}
	
	@Disabled
	@Test
	void testNameCheck() {
		log.info(signUpService.nickNameCheck("tam")+"");
	}

	@Disabled
	@Test
	void testEmailCheck() {
		log.info(signUpService.emailCheck("user@gmail.com")+"");
	}
	
	@Disabled
	@Test
	void testQuantityCheck() {
		log.info(signUpService.quantityCheck(1,3)+"");
	}
	@Disabled
	@Test
	void testSignUp() {
		MembersDto member= new MembersDto(0,"testUser2","testUser2","testUser2","수원시","팔달구","21231","990408",null,"user@naver.com","01023451234",0,null,"pop");
		log.info(signUpService.signUp(member)+"");
	}

}
