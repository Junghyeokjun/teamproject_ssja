package teamproject.ssja.controller.login;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import teamproject.ssja.dto.UserRoleAndAuthDTO;
import teamproject.ssja.dto.logindto.CustomUserDetailsDTO;

@RestController
public class LoginAsyncController {

	@RequestMapping("/userInfo")
	public UserRoleAndAuthDTO throwUserInfo() {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		if(authentication.getAuthorities().equals("ROLE_USER") && authentication.getAuthorities().equals("ROLE_ADMIN")) {
			Object principal = authentication.getPrincipal();
			CustomUserDetailsDTO userDetail = (CustomUserDetailsDTO)principal;
			return new UserRoleAndAuthDTO(userDetail.getUserInfo().getM_Name(),userDetail.getUserInfo().getAuth());
		}else{
			return new UserRoleAndAuthDTO("GUEST", "ROLE_ANONYMOUS");
		}
	}
}
