package teamproject.ssja.service.mypage;

import org.springframework.stereotype.Service;

import teamproject.ssja.dto.AddressForm;
import teamproject.ssja.dto.UserInfoDTO;

@Service
public interface MyPageService {
	

	
	UserInfoDTO getUserInfo(long username);
	void changeAddress(AddressForm addressForm);
	UserInfoOrder getUserInfoOrder(long username);
	

}
