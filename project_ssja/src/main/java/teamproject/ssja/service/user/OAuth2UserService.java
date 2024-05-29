package teamproject.ssja.service.user;

import java.util.Map;
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
import teamproject.ssja.dto.logindto.NaverResponse;
import teamproject.ssja.dto.logindto.OAuth2Response;
import teamproject.ssja.dto.logindto.SocialUserInfoDTO;
import teamproject.ssja.exception.DuplicateEmailException;
import teamproject.ssja.mapper.SocialUserMapper;

//소셜로그인 OAuth2 방식 상속한 Service 여기서 OAuth2로그인 로직 실행
//userRequest로 오는 데이터를 getAttribute로 조회한 후 OAuth2Response 구현체만 잘 지켜 주시면
//Provider if문에서 폴리몰피즘으로 생성만 해주신다면 로직은 이미 다 해놨습니다.
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
		
		
		
		//소셜 로그인 제공자 별 분류하여  oAuth2Response생성 후 로그인 및 회원 가입 로직은 if문을 지나서 실행
		
		//네이버 소셜 로그인일 경우
		if(registraionId.equals("naver")) {
			oAuth2Response = new NaverResponse(oAuth2User.getAttributes());
			
			//구글 소셜 로그인일 경우 -> 데이터 넘오는 방식이 조금 다르기에 분류
		}else if(registraionId.equals("google")) {
			
			
		}else {
			return null;
		}
		
		//로그인 및 검증 로직 실행 
		String username = oAuth2Response.getProvider() + " " + oAuth2Response.getProviderId();
		SocialUserInfoDTO existUser = socialUserMapper.findByUserName(username);
		String auth = "ROLE_USER";
		
		//존재하지 않을 시 DB에 저장을 위해 실행 되는 로직
		 if (existUser == null) {
			 
			 SocialUserInfoDTO  socialUser = new SocialUserInfoDTO();
			 socialUser.setUsername(username);
			 socialUser.setEmail(oAuth2Response.getEmail());
			 socialUser.setAuth(auth);
			 socialUser.setName(oAuth2Response.getName());
			 socialUser.setNickname(oAuth2Response.getNickName());
			 
			 //기존 가입 회원 유저의 이메일과 소셜 로그인의 이메일을 체크 존재할 경우 해당 회원의 기본키인 M_NO를 가져옴
			 long existingMemberNum = socialUserMapper.checkDuplicateEmail(oAuth2Response.getEmail());
			 
			 if(existingMemberNum > 0) {
				 //기존 가입한 유저의 이메일이 존재할 경우 해당 회원의 기본키를 받아 이를 토대로 소셜 로그인 DB에 추가해 테이블 관 연관을 맺음
				 System.out.println(existingMemberNum+"회원번호의 유저가 이미 존재");
				 socialUser.setId(existingMemberNum);
				 socialUserMapper.addSocialExistingUser(socialUser);
				 
			 }else {
	            socialUser.setRandomPw(passwordEncoder.encode(UUID.randomUUID().toString().substring(0, 8)));
	            //임의의 랜덤 비밀번호 부여 회원 테이블에 도 추가하기에 pw는 not null이기에 랜덤 비밀번호를 일단 넣음
	            
	            socialUserMapper.enroll(socialUser);//회원 테이블에 기본적인 id랑 이메일 회원 번호 추가
	            socialUserMapper.enrollAuth(socialUser);//회원 테이블 추가로 회원 테이블 용 권한테이블에 추가
	            socialUserMapper.save(socialUser);//회원 번호 시퀀스 공유하여 소셜 로그인 유저 테이블에 추가
	            
	            socialUser.setRandomPw(null);
			 }
	            
	        } else if(existUser.getEmail() != oAuth2Response.getEmail()){
	        	
	        		auth = existUser.getAuth();
	        		
	        	//중복 이메일 체크 같을 경우 변경
	        	  if (!existUser.getEmail().equals(oAuth2Response.getEmail())) {
	                    existUser.setEmail(oAuth2Response.getEmail());
	                    socialUserMapper.updateEmail(existUser);
	                }
	        }

		
		 SocialUserInfoDTO user = socialUserMapper.findByUserName(username);
		 System.out.println("socia login user  "+ user);
		 
	        return new CustomPrincipal(oAuth2Response, auth,user.getId());
		}catch(Exception e) {
				throw new RuntimeException(e);
		}
	}
		
}
