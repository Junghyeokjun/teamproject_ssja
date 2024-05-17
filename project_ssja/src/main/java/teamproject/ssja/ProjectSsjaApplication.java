package teamproject.ssja;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan(value = {"teamproject.ssja.mapper"})
public class ProjectSsjaApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectSsjaApplication.class, args);
		//
	}

}
