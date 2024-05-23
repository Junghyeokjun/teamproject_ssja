package teamproject.ssja.dto.logindto;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Setter;
import teamproject.ssja.dto.userinfo.UserInfoDTO;

@Setter
public class CustomUserDetailsDTO implements UserDetails{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private UserInfoDTO userInfo;
	
	
	public  CustomUserDetailsDTO(UserInfoDTO userInfoDTO) {
		this.userInfo = userInfoDTO;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		Collection<GrantedAuthority> authorities = new ArrayList<>() ;
		
		authorities.add(new SimpleGrantedAuthority(userInfo.getAuth()));
		return authorities;
	}

	public UserInfoDTO getUserInfo(){
		return this.userInfo;
	}
	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return userInfo.getM_Pw();
	}

	@Override
	public String getUsername() {
		// TODO Auto-generated method stub
		return userInfo.getM_Id();
	}

	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return true;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}

}
