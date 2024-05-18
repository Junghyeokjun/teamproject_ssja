package teamproject.ssja.configure;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class EncodeConfigure {

	
	@Bean
	PasswordEncoder passwordEncode() {
		return new CustomNoOpPasswordEncoder();
	}
}
