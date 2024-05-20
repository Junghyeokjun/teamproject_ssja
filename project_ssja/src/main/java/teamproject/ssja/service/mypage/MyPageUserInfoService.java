package teamproject.ssja.service.mypage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.UserInfoDTO;
import teamproject.ssja.mapper.MyPageMapper;

@Service
public class MyPageUserInfoService implements MyPageService{

	@Autowired
	MyPageMapper MyPageMapper;
	
	@Override
	public UserInfoDTO getUserInfo(String username) {
		
		return MyPageMapper.getUserInfoInMyPage(username);

	}

}
