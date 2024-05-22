package teamproject.ssja;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletContextInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.security.web.session.HttpSessionEventPublisher;

@SpringBootApplication
@MapperScan(value = {"teamproject.ssja.mapper"})
public class ProjectSsjaApplication {

	public static void main(String[] args) {
		SpringApplication.run(ProjectSsjaApplication.class, args);
		//test
	}
	
	 @Bean
	    public ServletContextInitializer servletContextInitializer() {
	        return new ServletContextInitializer() {
	            @Override
	            public void onStartup(ServletContext servletContext) throws ServletException {
	                servletContext.addListener(new HttpSessionEventPublisher());
	            }
	        };
	    }

}
