package teamproject.ssja;

import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.fail;

import java.sql.Connection;

import javax.sql.DataSource;

import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.RequiredArgsConstructor;
@SpringBootTest
@ExtendWith(SpringExtension.class)
public class DBCOnnectionTest {
	
	@Autowired
	private  DataSource dataSource;
	
	
	@Test
	@DisplayName("DB커넥션 테스트")
	void testConnection() {
		try {
			
			Connection conn = dataSource.getConnection();
			assertNotNull(conn);
		} catch (Exception e) {
			fail();
		}
	}

}
