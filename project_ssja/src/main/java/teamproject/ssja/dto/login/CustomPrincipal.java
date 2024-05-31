package teamproject.ssja.dto.login;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import lombok.Getter;
import lombok.Setter;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
@Getter
@Setter
public class CustomPrincipal implements UserDetails, OAuth2User {
//세션, 소셜 로그인 인터페이스 2개를 다 구현한 통합 스프링 시큐리티 Authentication에 담을 구현체입니다.
    
	private static final long serialVersionUID = 1L;
	private UserInfoDTO userInfo;
    private OAuth2Response oAuth2Response;
    private boolean isOAuth2User;
    private String auth;
    private long memberNum;
    private String email;

    //세션 기반 로그인의 경우
    public CustomPrincipal(UserInfoDTO userInfo) {
        this.userInfo = userInfo;
        this.isOAuth2User = false;
        this.auth = userInfo.getAuth();
        this.memberNum = userInfo.getM_No();
        this.email = userInfo.getM_Email();
    }
    
    //OAuth2 소셜 로그인의 경우
    public CustomPrincipal(OAuth2Response oAuth2Response, String auth, long id) {
        this.oAuth2Response = oAuth2Response;
        this.isOAuth2User = true;
        this.auth = auth;
        this.memberNum = id;
        this.email = oAuth2Response.getEmail();
    }

    @Override
    public Map<String, Object> getAttributes() {
        if (isOAuth2User) {
            return Map.of();
        }
        return null;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        Collection<GrantedAuthority> authorities = new ArrayList<>();
        authorities.add(new SimpleGrantedAuthority(auth));
        return authorities;
    }

    @Override
    public String getName() {
        if (isOAuth2User) {
            return oAuth2Response.getName();
        }
        return userInfo.getM_Id();
    }

    @Override
    public String getPassword() {
        if (!isOAuth2User) {
            return userInfo.getM_Pw();
        }
        return null;
    }

    @Override
    public String getUsername() {
        if (!isOAuth2User) {
            return userInfo.getM_Id();
        }
        return oAuth2Response.getProvider() + " " + oAuth2Response.getProviderId();
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }
}
