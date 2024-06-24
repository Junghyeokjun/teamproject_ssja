package teamproject.ssja.configure;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {

    	//현재 상대경로를 이용하여 매핑중이므로 사용중지 
        registry.addResourceHandler("/images/board_content/**")
        	.addResourceLocations("file:/home/ubuntu/images/");
    }
}
