package teamproject.ssja;

import org.springframework.security.core.context.SecurityContextHolder;

import teamproject.ssja.dto.login.CustomPrincipal;

//현재 로그인 중인 유저의 아이디 와 기본키인 M_NO를 컨트롤러에서 쉽게 뽑아 쓸 수 있도록 제공해주는 클래스 입니다.
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
				return user.getEmail();
			} else {
				return user.getUsername();
			}
		} else {
			return null;
		}

	}

}
