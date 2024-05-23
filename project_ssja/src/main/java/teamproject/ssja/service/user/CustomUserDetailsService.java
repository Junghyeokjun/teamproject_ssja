package teamproject.ssja.service.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.logindto.CustomUserDetailsDTO;
import teamproject.ssja.dto.userinfo.ChangePasswordForm;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.mapper.LoginMapper;
import teamproject.ssja.mapper.MyPageMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	LoginMapper loginMapper;
	@Autowired
	MyPageMapper myPageMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserInfoDTO userData = loginMapper.findByUsername(username);
		if(userData != null) {
		CustomUserDetailsDTO userDetailsDTO = new CustomUserDetailsDTO(userData);
	
		return userDetailsDTO;
		}
	
		return null;
	}
	
	public Boolean changePasswordProcess(String username, ChangePasswordForm passwordForm) {
		
		UserInfoDTO userData = loginMapper.findByUsername(username);
		
		
		if(userData.getM_Pw().equals(passwordForm.getCurrentPassword()) && userData != null) {
			
			Map<String, String> params = new HashMap<>();
			params.put("username",username);
			params.put("newPassword",passwordForm.getNewPassword());
			
			
			myPageMapper.changePasswordProcess(params);
			
			return true;
		}
		
		
		return false;
	}

}
