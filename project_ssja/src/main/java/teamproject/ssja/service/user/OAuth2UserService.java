package teamproject.ssja.service.user;

import java.util.UUID;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.dto.logindto.CustomPrincipal;
import teamproject.ssja.dto.logindto.GoogleResponse;
import teamproject.ssja.dto.logindto.KakaoResponse;
import teamproject.ssja.dto.logindto.NaverResponse;
import teamproject.ssja.dto.logindto.OAuth2Response;
import teamproject.ssja.dto.logindto.SocialUserInfoDTO;
import teamproject.ssja.mapper.SocialUserMapper;


@Service
@RequiredArgsConstructor
public class OAuth2UserService extends DefaultOAuth2UserService{
	
	private final SocialUserMapper socialUserMapper;
	private final PasswordEncoder passwordEncoder;
	
	@Transactional	
	@Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
		
		try {
		
		OAuth2User oAuth2User = super.loadUser(userRequest);
		String registraionId = userRequest.getClientRegistration().getRegistrationId();
		
		OAuth2Response oAuth2Response = null;
			
		//네이버 소셜 로그인일 경우
		if(registraionId.equals("naver")) {
			oAuth2Response = new NaverResponse(oAuth2User.getAttributes());
			
			//카카오 소셜 로그인일 경우
		}else if(registraionId.equals("kakao")) {
			oAuth2Response = new KakaoResponse(oAuth2User.getAttributes());			
			//구글 소셜 로그인일 경우	
		}else if(registraionId.equals("google")) {
			oAuth2Response = new GoogleResponse(oAuth2User.getAttributes());			
			
		}else {
			return null;
		}
		
		String username = oAuth2Response.getProvider() + " " + oAuth2Response.getProviderId();
		
		SocialUserInfoDTO existUser = socialUserMapper.findByUserName(username);
		String auth = null;
		
		 if (existUser == null) {
			 SocialUserInfoDTO  socialUser = new SocialUserInfoDTO();
			  auth = "ROLE_USER";
	            socialUser.setUsername(username);
	            socialUser.setEmail(oAuth2Response.getEmail());
	            socialUser.setAuth(auth);
	            socialUser.setName(oAuth2Response.getName());
	            socialUser.setNickname(oAuth2Response.getNickName());
	            socialUser.setRandomPw(passwordEncoder.encode(UUID.randomUUID().toString().substring(0, 8)));
	            
	            socialUserMapper.enroll(socialUser);//회원 테이블에 기본적인 id랑 이메일 회원 번호 추가
	            socialUserMapper.enrollAuth(socialUser);//회원 테이블 추가로 회원 테이블 용 권한테이블에 추가
	            
	            socialUser.setRandomPw(null);
	            socialUserMapper.save(socialUser);//회원 번호 시퀀스 공유하여 소셜 로그인 유저 테이블에 추가
	            
	        } else if(existUser.getEmail() != oAuth2Response.getEmail()){

	            auth = existUser.getAuth();
	            existUser.setEmail(oAuth2Response.getEmail());

	            socialUserMapper.updateEmail(existUser);
	        }

		
		 SocialUserInfoDTO user = socialUserMapper.findByUserName(username);
		 System.out.println("socia login user  "+ user);
		 
	        return new CustomPrincipal(oAuth2Response, auth,user.getId());
		}catch(Exception e) {
				throw new RuntimeException(e);
		}
	}
		
}
