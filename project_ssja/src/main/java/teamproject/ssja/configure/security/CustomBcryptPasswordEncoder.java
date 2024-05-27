package teamproject.ssja.configure.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomBcryptPasswordEncoder implements PasswordEncoder {

	private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
	
	@Override
	public String encode(CharSequence rawPassword) {
		String encodedPw = encoder.encode(rawPassword);
		log.warn(" encode: " + encodedPw);
		return encodedPw;
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		log.warn("matches: " + rawPassword + " : " + encodedPassword);
		
		return encoder.matches(rawPassword, encodedPassword);
	}

}