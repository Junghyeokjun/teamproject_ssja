package teamproject.ssja.service.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.UserInfoDTO;
import teamproject.ssja.dto.logindto.CustomUserDetailsDTO;
import teamproject.ssja.mapper.LoginMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService{

	@Autowired
	LoginMapper loginMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		UserInfoDTO userData = loginMapper.findByUsername(username);
		if(userData != null) {
		CustomUserDetailsDTO userDetailsDTO = new CustomUserDetailsDTO(userData);
	
		return userDetailsDTO;
		}
	
		return null;
	}

}
