package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.sql.Date;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.context.annotation.Import;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.configure.AOPConfig;
import teamproject.ssja.dto.AuthDto;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.PurchaseDto;

@Slf4j
@Import(AOPConfig.class)
@SpringBootTest
class MembersMapperTest {

	@Autowired
	MembersMapper membersMapper;

	//@Disabled
	@Test
	void test() {
		assertNotNull(membersMapper);
	}

	//@Disabled
	@Test
	void SelectMidTest() {
		String mid=membersMapper.getMid("testUser1");
		log.info(mid);
	}
	
	//@Disabled
	@Test
	void SelectMnameTest() {
		String mName=membersMapper.getMNickName("tam");
		log.info(mName);
	}
	
	//@Disabled
	@Test
	void SelectQuantityTest() {
		long quantity=membersMapper.getProQuantity(1);
		log.info(quantity+"");
	}
	
	//@Disabled
	@Test
	void SelectMEmailTest() {
		String mEmail=membersMapper.getMEmail("user@gmail.com");
		log.info(mEmail);
	}
	//@Disabled
	@Test
	void SelectEmailTest() {
		String mEmail=membersMapper.selectEmail("test");
		log.info(mEmail);
	}
	
	//@Disabled
	@Test
	void insertMnameTest() {
		assertThrows(DuplicateKeyException.class, () ->{
			MembersDto member= new MembersDto(0,"testUser1","testUser1","testUser1","수원시","팔달구",
				"21231",Date.valueOf("2024-06-25"),null,"user@gmail.com","01023451234",0,null,"tam");
		
		int result=membersMapper.insertMember(member);
		log.info(result+"");
		});
	}

	
	//@Disabled
	@Test
	void updatePwTest() {
		String pw=(new BCryptPasswordEncoder()).encode("1234");
		membersMapper.updatePw("test", pw);
	}
	
	//@Disabled
	@Test
	void subPointTest() {
		System.out.println(membersMapper.subPoint(21,1000));
	}
	
	
}
