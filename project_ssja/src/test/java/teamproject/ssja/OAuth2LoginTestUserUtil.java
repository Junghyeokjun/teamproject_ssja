package teamproject.ssja;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Collections;
import java.util.Map;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.core.user.DefaultOAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.security.oauth2.core.user.OAuth2UserAuthority;
import org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors;

import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.login.NaverResponse;
import teamproject.ssja.dto.login.OAuth2Response;

public class OAuth2LoginTestUserUtil {
	public static OAuth2User createOAuth2User() {
        Map<String, Object> attributes = Map.of("naver", "test1", "name", "Test User", "email", "test1@naver.com");
        	  Set<GrantedAuthority> authorities = Set.of(new SimpleGrantedAuthority("ROLE_USER"));

        	  
            OAuth2Response response = new NaverResponse(attributes) {
				
                private long id;
             

                @Override
                public String getProvider() {
                		//네이버 소셜 로그인 구현체 이기에 네이버로 Set
                    return "naver";
                }
                @Override
                public long getId() {
            		return id;
            	}

                @Override
            	public void setId(long id) {
            		this.id = id;
            	}


            	@Override
                public String getProviderId() {
                    return "id";
                }

                @Override
                public String getEmail() {
                    return "test@naver.com";
                }

                @Override
                public String getName() {
                    return "testname";
                }


            	@Override
            	public String getNickName() {
            		// TODO Auto-generated method stub
            	      return "testname";            	}

			};
		return new CustomPrincipal(response,"ROLE_SOCAIL",90L);

    }

    public static SecurityMockMvcRequestPostProcessors.OAuth2LoginRequestPostProcessor oauth2Login() {
        return SecurityMockMvcRequestPostProcessors.oauth2Login().oauth2User(createOAuth2User());
    }
}
