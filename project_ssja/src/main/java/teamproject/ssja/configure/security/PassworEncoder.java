package teamproject.ssja.configure.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
public class PassworEncoder {

    @Bean
    public PasswordEncoder passwordEncoder() {
        //return new CustomBcryptPasswordEncoder();
    	return new CustomBcryptPasswordEncoder();
    }
}