package teamproject.ssja.userinfotest;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@SpringBootTest
@Slf4j
public class encodeTest {

	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Test
	@DisplayName("비밀 번호 암호화 테스트")
	void encoderPasswordTest() {
		
		String as = "1234";
		String password = passwordEncoder.encode(as);
		
		assertNotNull(password);
		Assertions.assertThat(password).isNotEqualTo(passwordEncoder.encode(as));

		log.info("pw {}",password);
		
	}
}
