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
    	registry.addResourceHandler("/images/review/**")
    	.addResourceLocations("file:/home/ubuntu/images/review/");
//    	registry.addResourceHandler("/images/board_content/**")
//      .addResourceLocations("file://desktop-rduhp84/board_content/");
    	
    	registry.addResourceHandler("/home/ubuntu/images/product_banner/**")
        .addResourceLocations("file:/home/ubuntu/images/product_banner/");
    	
        registry.addResourceHandler("/home/ubuntu/images/product_cover/**")
        .addResourceLocations("file:/home/ubuntu/images/product_cover/");
        
        registry.addResourceHandler("/home/ubuntu/images/product_details/**")
        .addResourceLocations("file:/home/ubuntu/images/product_details/");
    	
    }
}
