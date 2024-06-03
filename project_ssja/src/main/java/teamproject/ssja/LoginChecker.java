package teamproject.ssja;


import java.util.function.Function;

import org.springframework.security.core.context.SecurityContextHolder;

import teamproject.ssja.dto.login.CustomPrincipal;

public class LoginChecker {

	private LoginChecker() {}
	
	public static  int check() {
		CustomPrincipal user = (CustomPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		//그냥 오늘 배운거 써봤습니다. 로그인 했을 경우에만 양수를 반환하며 
		//2의 경우 소셜이고 1을 반환할 경우 회원 등록을 한 소셜유저 또는 세션 로그인 입니다. 
		
		try {
			
			if(user == null) return 0;//로그인 X로 null일 경우 0 반환
			
		Function<CustomPrincipal, Integer> func = (u) -> u.isOAuth2User()&&u.getAuth().equals("ROLE_SOCIAL")?2:1;  
		
		return func.apply(user);
		//if(LoginChecker.check==1) -> true 세션 로그인
		//else if(LoginChecker.check==2) ->  소셜 로그인 true
		//else 또는 else if(LoginChecker.check==0) -> 로그인 안해서 null 이 경우 0 으로 반환
		//또는 switch문 사용
		}catch (Exception e) {
			//예외 처리
			return 0;
		}
		
	}
	
}