package teamproject.ssja.dto.logindto;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Map;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.user.OAuth2User;

import teamproject.ssja.dto.userinfo.UserInfoDTO;

public class TestCustomPrincipal implements UserDetails, OAuth2User {


    
	private static final long serialVersionUID = 1L;
	private UserInfoDTO userInfo;
    private OAuth2Response oAuth2Response;
    private boolean isOAuth2User;
    private String auth;

    //세션 기반 로그인의 경우
    public TestCustomPrincipal(UserInfoDTO userInfo) {
        this.userInfo = userInfo;
        this.isOAuth2User = false;
        this.auth = userInfo.getAuth();
    }
    
    //소셜 로그인의 경우
    public TestCustomPrincipal(OAuth2Response oAuth2Response, String auth) {
        this.oAuth2Response = oAuth2Response;
        this.isOAuth2User = true;
        this.auth = auth;
    }

    @Override
    public Map<String, Object> getAttributes() {
        if (isOAuth2User) {
            // Implement logic to return OAuth2 attributes if necessary
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
        return !isOAuth2User && true; // or add real logic
    }

    @Override
    public boolean isAccountNonLocked() {
        return !isOAuth2User && true; // or add real logic
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return !isOAuth2User && true; // or add real logic
    }

    @Override
    public boolean isEnabled() {
        return !isOAuth2User && true; // or add real logic
    }
}
