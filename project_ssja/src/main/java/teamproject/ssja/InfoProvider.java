package teamproject.ssja;

import org.springframework.security.core.context.SecurityContextHolder;

import teamproject.ssja.dto.login.CustomPrincipal;

//현재 로그인 중인 유저의 아이디 와 기본키인 M_NO를 컨트롤러에서 쉽게 뽑아 쓸 수 있도록 제공해주는 클래스 입니다.
//현재 로그인 중인 유저의 정보를 토대로 DB에 접근 시 사용을 권장 회원에 대한 정보를 모두 서버에서 해결하도록 방향성 잡음
public class InfoProvider {
	
	  public static String userAuth() {
	      CustomPrincipal user = (CustomPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	      return  user.getAuth();
	   }

	public static long getM_NO() {
		CustomPrincipal user = (CustomPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		return user.getMemberNum();
	}

	//소셜일 경우 이메일, 회원 로그인일 경우 id를 반환
	public static String userId() {
		CustomPrincipal user = (CustomPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		if (user != null) {
			if (user.isOAuth2User()) {
				return user.getEmail(); //소셜 로그인일 경우 해당 소셜 이메일 반환
			} else {
				return user.getUsername();//세션 로그인일 경우 username 반환
			}
		} else {return null;}
	}

}
