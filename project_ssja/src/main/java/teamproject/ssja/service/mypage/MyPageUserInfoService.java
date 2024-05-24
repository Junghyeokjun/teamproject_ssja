package teamproject.ssja.service.mypage;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.mapper.MyPageMapper;

@Slf4j
@Service
public class MyPageUserInfoService implements MyPageService{

	@Autowired
	MyPageMapper myPageMapper;
	@Autowired
	PasswordEncoder passwordEncoder;
	

@Override
	public UserInfoDTO getUserInfo(long username) {
		
		return myPageMapper.getUserInfoInMyPage(username);

	}

	@Override
	public void changeAddress(AddressForm addressForm) {
		
		myPageMapper.changeAddress(addressForm);
	}

	@Override
	public String deleteUserEnroll(String userId) {
		
		myPageMapper.deleteUserEnroll(userId);
			 
			LocalDate today = LocalDate.now();
			log.info("오늘{}",today);
			LocalDate EnrollDeleteDate = today.plusDays(7);
			DateTimeFormatter formatString = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			 String EnrollDelDate = EnrollDeleteDate.format(formatString);
			 log.info("EnrollDelDate {}",EnrollDelDate);
			 
			 return EnrollDelDate;
	
	}
	@Override
	public void deleteEnrolled() {
		// TODO Auto-generated method stub
		myPageMapper.deleteEnrolled();
		
	}

	@Override
	public List<String> findDeleteEnrolledUsers() {
		List<String> enrolledDeleteUsers=myPageMapper.findDeleteEnrolledUsers();
		return enrolledDeleteUsers;
	}

	@Override
	public void deleteEnrolledUsersAuth(List<String> enrolledDeleteUsers) {
		myPageMapper.deleteEnrolledUsersAuth(enrolledDeleteUsers);
		
	}

	@Override
	public void modifyUserEmail(String email, String username) {
		Map<String,String> params = new HashMap<>();
		
		params.put("userId",username);
		params.put("email",email);
		myPageMapper.modifyUserEmail(params);
		
	}

	

	
	

}