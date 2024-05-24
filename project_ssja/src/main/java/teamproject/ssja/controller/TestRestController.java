package teamproject.ssja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.service.signup.SignUpService;

@Controller
@RestController
@RequestMapping("/testrest")
public class TestRestController {
	
	@Autowired
	SignUpService signUpService;
	
//	패스워드 엔코더 추가후
//	@Autowired 
//	PasswordEncoder passwordEncoder;


	@GetMapping("/idCheck")
	public boolean idCheck(String id) {
		
		return signUpService.idCheck(id);
	}
	
	@GetMapping("/nickNameCheck")
	public boolean nickNameCheck(String nickName) {
		return signUpService.nickNameCheck(nickName);
	}


	@GetMapping("/emailCheck")
	public boolean emailCheck(String email) {
		return signUpService.emailCheck(email);
	}

	@GetMapping("/quantityCheck")
	public boolean quantityCheck(long proNo,int quantity) {
		return signUpService.quantityCheck(proNo,quantity);
	}
	
	@PostMapping("/signUp")
	public boolean signUp(MembersDto member,String email, String domain) {
//		패스워드 엔코더 추가후
//		member.setM_PW(passwordEncoder.encode(member.getM_PW()));
		System.out.println(member);
		member.setM_EMAIL(email+"@"+domain);
		return signUpService.signUp(member);
		
	}

	@PostMapping("/purchase_complete")
	public ModelAndView purchaseComplete(ModelAndView mv) {
		
		mv.setViewName("purchase_complete");
		
		return mv;
	}

}
