package teamproject.ssja.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;

@Slf4j
@SpringBootTest
class TestServiceImplTest {

	@Autowired
	TestService testService;
	
	@Disabled
	@Test
	void test() {
		assertNotNull(testService);
	}

	@Disabled
	@Test
	void testIdCheck() {
		log.info(testService.idCheck("testUser1")+"");
	}
	
	@Disabled
	@Test
	void testNameCheck() {
		log.info(testService.nameCheck("testUser1")+"");
	}

	@Disabled
	@Test
	void testSignUp() {
		MembersDto member= new MembersDto(0,"testUser2","testUser2","testUser2","수원시","팔달구","21231","990408",null,"user@naver.com","01023451234",0,null);
		log.info(testService.signUp(member)+"");
	}

}
