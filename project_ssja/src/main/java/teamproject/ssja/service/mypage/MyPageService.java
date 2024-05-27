package teamproject.ssja.service.mypage;



import org.springframework.stereotype.Service;

import java.util.*;

import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.UserInfoDTO;

@Service
public interface MyPageService {
	

	
	UserInfoDTO getUserInfo(long username);
	void changeAddress(AddressForm addressForm);
	String deleteUserEnroll(String userId);
	void deleteEnrolled();
	List<String> findDeleteEnrolledUsers();
	
	void deleteEnrolledUsersAuth(List<String> enrolledDeleteUsers);
	void modifyUserEmail(String email, String username);
}
