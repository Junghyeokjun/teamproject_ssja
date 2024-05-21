package teamproject.ssja.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.AddressForm;
import teamproject.ssja.dto.UserInfoDTO;
import teamproject.ssja.mapper.MyPageMapper;

@Service
public class MyPageUserInfoService implements MyPageService{

	@Autowired
	MyPageMapper MyPageMapper;
	
	@Override
	public UserInfoDTO getUserInfo(long username) {
		
		return MyPageMapper.getUserInfoInMyPage(username);

	}

	@Override
	public void changeAddress(AddressForm addressForm) {
		
		MyPageMapper.changeAddress(addressForm);
	}

	@Override
	public UserInfoOrder getUserInfoOrder(long username) {
		// TODO Auto-generated method stub
		return null;
	}
	

}
