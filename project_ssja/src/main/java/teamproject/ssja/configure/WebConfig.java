package teamproject.ssja.configure;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/images/board_content/**")
                .addResourceLocations("file:///C:/Users/601-5/git/temaproject_ssja/project_ssja/src/main/resources/static/images/board_content/");
    }
}
