package teamproject.ssja.service.mypage;

import org.springframework.stereotype.Service;

import teamproject.ssja.dto.UserInfoDTO;

@Service
public interface MyPageService {
	

	
	UserInfoDTO getUserInfo(String username);
	

}
