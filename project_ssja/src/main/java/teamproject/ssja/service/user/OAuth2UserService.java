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
import teamproject.ssja.dto.logindto.GoogleResponse;
import teamproject.ssja.dto.logindto.KakaoResponse;
import teamproject.ssja.dto.logindto.NaverResponse;
import teamproject.ssja.dto.logindto.OAuth2Response;
import teamproject.ssja.dto.logindto.SocialUserInfoDTO;
import teamproject.ssja.exception.DuplicateEmailException;
import teamproject.ssja.mapper.SocialUserMapper;

//소셜로그인 OAuth2 방식 상속한 Service 여기서 OAuth2로그인 로직 실행
//userRequest로 오는 데이터를 getAttribute로 조회한 후 OAuth2Response 구현체만 잘 지켜 주시면
//Provider if문에서 폴리몰피즘으로 생성만 해주신다면 로직은 이미 다 해놨습니다. 
//네이버 제가 했고 구글이랑 카카오 더하면 깃허브랑 페이스북? 정도 원하시는대로 추가하시면 됩니다.
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
			
			//카카오 소셜 로그인일 경우
		}else if(registraionId.equals("kakao")) {
			oAuth2Response = new KakaoResponse(oAuth2User.getAttributes());			
			//구글 소셜 로그인일 경우	
		}else if(registraionId.equals("google")) {
			oAuth2Response = new GoogleResponse(oAuth2User.getAttributes());			
			
		}else {
			return null;
		}
		
		//로그인 및 검증 로직 실행 
		String username = oAuth2Response.getProvider() + " " + oAuth2Response.getProviderId();
		SocialUserInfoDTO existUser = socialUserMapper.findByUserName(username);
		String auth = "";
		
		
		//존재하지 않을 시 DB에 저장을 위해 실행 되는 로직
		 if (existUser == null) {
			 
			 SocialUserInfoDTO  socialUser = new SocialUserInfoDTO();
			 socialUser.setUsername(username);
			 socialUser.setEmail(oAuth2Response.getEmail());
			 socialUser.setName(oAuth2Response.getName());
			 socialUser.setNickname(oAuth2Response.getNickName());
			 
			 //기존 가입 회원 유저의 이메일과 소셜 로그인의 이메일을 체크 존재할 경우 해당 회원의 기본키인 M_NO를 가져옴
			 //가입하지 않은 경우 기본키 회원 번호 M_NO가 존재하지 않기에 Null가능성에 Long타입
			 Long existingMemberNum = socialUserMapper.checkDuplicateEmail(oAuth2Response.getEmail());
			 
			 if(existingMemberNum != null) {
				 //기존 가입한 유저의 이메일이 존재할 경우 해당 회원의 기본키를 받아 이를 토대로 소셜 로그인 DB에 추가해 테이블 관 연관을 맺음
				 //기존 가입 유저가 admin의 권한이어도 소셜로그인은 무조건  USER의 권한으로 고정
				 auth="ROLE_USER";
				 socialUser.setAuth(auth);
				 socialUser.setId(existingMemberNum);
				 socialUserMapper.addSocialExistingUser(socialUser);
				 
				 
			 }else {//회원가입에도 없고 소셜로그인 db에도 없는 처음 사이트에 소셜로그인으로 최초 로그인을 진행하는 유저의 경우
	            socialUser.setRandomPw(passwordEncoder.encode(UUID.randomUUID().toString().substring(0, 8)));
	            //임의의 랜덤 비밀번호 부여 회원 테이블에 도 추가하기에 pw는 not null이기에 랜덤 비밀번호를 일단 넣음
	            
	            auth="ROLE_SOCIAL";//소셜 로그인과ㅑ 회원 유저의 구분을 위한 권한 분리
	            socialUser.setAuth(auth);
	            socialUserMapper.enroll(socialUser);//회원 테이블에 기본적인 id랑 이메일 회원 번호 추가
	            socialUserMapper.enrollAuth(socialUser);//회원 테이블 추가로 회원 테이블 용 권한테이블에 추가
	            socialUserMapper.save(socialUser);//회원 번호 시퀀스 공유하여 소셜 로그인 유저 테이블에 추가
	            
	            socialUser.setRandomPw(null);
			 }
	            
			 //소셜로그인 DB에 존재하는 유저일 경우 로직
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
				//어떠한 예외가 발생하여도 런타임 예외로 던져 트랜잭션 동기화 유지
		}
	}
		
}
