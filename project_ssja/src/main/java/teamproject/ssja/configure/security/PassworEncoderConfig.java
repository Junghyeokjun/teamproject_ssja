package teamproject.ssja.configure.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class PassworEncoderConfig {

	
	@Bean
	PasswordEncoder passwordEncoderConfig() {
		
		return new CustomNoOpPasswordEncoder();
	}
	
}
