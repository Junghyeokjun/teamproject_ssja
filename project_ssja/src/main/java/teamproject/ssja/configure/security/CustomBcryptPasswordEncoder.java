package teamproject.ssja.configure.security;

import org.springframework.security.crypto.password.PasswordEncoder;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class CustomBcryptPasswordEncoder implements PasswordEncoder {

	@Override
	public String encode(CharSequence rawPassword) {
		
		log.warn("before encode: " + rawPassword);
		
		return rawPassword.toString();
	}

	@Override
	public boolean matches(CharSequence rawPassword, String encodedPassword) {
		
		log.warn("matches: " + rawPassword + " : " + encodedPassword);
		
		return rawPassword.toString().equals(encodedPassword);
	}

}