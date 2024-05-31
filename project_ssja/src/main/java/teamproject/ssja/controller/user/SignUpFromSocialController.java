package teamproject.ssja.controller.user;

import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.service.signup.SignUpService;

@Controller
@Slf4j
@RequestMapping("/sign-up")
@RequiredArgsConstructor
public class SignUpFromSocialController {
	
	private final SignUpService signUpService;

	@RequestMapping("/from-social/before-agreement")
	public String signUpBeforeFromSocial() {
		
		return "/sign-up/fromsocialBefore";
	}
	
	@PostMapping("/fromsocial")
	public String signUpFromSocialPage(@AuthenticationPrincipal CustomPrincipal user,Model model) {
		long memberNum = user.getMemberNum();
		
		MembersDto userData = signUpService.getRelatedMember(memberNum);
		model.addAttribute("userData",userData);
				
		return "/sign-up/fromsocial";
	}
	@PostMapping("/regist")
	public  String registSocialToUser( MembersDto member, @AuthenticationPrincipal CustomPrincipal user) {
		member.setM_NO(user.getMemberNum());
		
		signUpService.registSocialToUser(member);
	
		return "redirect:/login";
	} 	
	
}
