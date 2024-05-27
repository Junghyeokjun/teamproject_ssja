package teamproject.ssja.configure.security;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.password.PasswordEncoder;

@SpringBootTest
class PasswordEncoderConfigTest {

    @Autowired
    PasswordEncoder passwordEncoder;

    @Test
    void test() {
        String as = "1111";
        String pass =  passwordEncoder.encode(as);

        assertNotNull(pass);
    }

}
