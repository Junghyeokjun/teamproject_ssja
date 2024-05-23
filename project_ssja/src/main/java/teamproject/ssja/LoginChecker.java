package teamproject.ssja;

import org.springframework.stereotype.Component;

import teamproject.ssja.dto.logindto.CustomUserDetailsDTO;

@Component
public class LoginChecker {
	
	//닉네임만 꺼내오기
	public String CheckLogin(CustomUserDetailsDTO userDetails) {
		String userNickName = (userDetails!= null)?userDetails.getUserInfo().getM_Name() :"GUEST" ;
		
		return userNickName;
		
	}


}