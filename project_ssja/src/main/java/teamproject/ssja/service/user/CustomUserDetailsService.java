package teamproject.ssja.service.user;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.userinfo.ChangePasswordForm;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.exception.UnMatchedPasswordException;
import teamproject.ssja.mapper.LoginMapper;
import teamproject.ssja.mapper.MyPageMapper;
@Slf4j
@Service("customUserDetail")
public class CustomUserDetailsService implements UserDetailsService  {

	@Autowired
	LoginMapper loginMapper;
	@Autowired
	MyPageMapper myPageMapper;
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException, UnMatchedPasswordException {
		UserInfoDTO userData = loginMapper.findByUsername(username);
		if(userData != null) {
			
		
			
		CustomPrincipal userDetailsDTO = new CustomPrincipal(userData);
	
		return userDetailsDTO;
		}
	
		throw new UsernameNotFoundException("User's username not found : " + username);
	}
	
	
	
	public Boolean changePasswordProcess(String username, ChangePasswordForm passwordForm) {
		
		//("before passwordForm{}",passwordForm);
		
		UserInfoDTO userData = loginMapper.findByUsername(username);
	
		passwordForm.setNewPassword(passwordEncoder.encode(passwordForm.getNewPassword()));
		
		if(passwordEncoder.matches(passwordForm.getCurrentPassword(), userData.getM_Pw()) && userData != null) {
			
			Map<String, String> params = new HashMap<>();
			params.put("username",username);
			params.put("newPassword",passwordForm.getNewPassword());
			
			
			myPageMapper.changePasswordProcess(params);
			
			return true;
		}
		
		
		return false;
	}


}
