package teamproject.ssja.service.mypage;



import org.springframework.stereotype.Service;

import java.util.*;

import teamproject.ssja.dto.AddressForm;
import teamproject.ssja.dto.UserInfoDTO;

@Service
public interface MyPageService {
	

	
	UserInfoDTO getUserInfo(long username);
	void changeAddress(AddressForm addressForm);
	String deleteUserEnroll(String userId);
	void deleteEnrolled();
	List<String> findDeleteEnrolledUsers();
	
	void deleteEnrolledUsersAuth(List<String> enrolledDeleteUsers);
}
