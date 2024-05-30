package teamproject.ssja.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.LoginChecker;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.email.MailDTO;
import teamproject.ssja.service.mypage.MailService;
import teamproject.ssja.service.signup.SignUpService;

@Controller
@RestController
@RequestMapping("/sign")
public class SignController {
	
	@Autowired
	SignUpService signUpService;
	@Autowired
	MailService mailService;
	
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
	public ModelAndView signUp(MembersDto member,String email, String domain ,ModelAndView mv) {
//		패스워드 엔코더 추가후
//		member.setM_PW(passwordEncoder.encode(member.getM_PW()));
		member.setM_EMAIL(email+"@"+domain);
		signUpService.signUp(member);
		mv.setViewName("temp_login");
		return mv;
		
	}

	 @PostMapping("/findId")
	 public void findId(String email) {
		 MailDTO mail=new MailDTO();
		 mail.setReceiver(email);
		 
		 mailService.findIDMail(mail);
		 
	 }

	 @PostMapping("/findPw")
	 public String findPw(String id) {
		 
		 String email=signUpService.getEmail(id);
		 if(email==null) {
			 return null;
		 }
		 MailDTO mail=new MailDTO();
		 mail.setReceiver(email);
		 String randomNum=mailService.randomNumMail(mail);
		 
		 return randomNum;
		 		 
	 }
	 
	 @PostMapping("/resetPw")
	 public void resetPw(String id,String pw) {
		 signUpService.resetPw(id,pw);
		 
		 		 
	 }
	 
	 @PostMapping("/emailAuth")
	 public String emailAuth(String email) {
		 MailDTO mail=new MailDTO();
		 mail.setReceiver(email);
		 
		 String AuthNum =mailService.randomNumMail(mail);
		 return AuthNum;
	 }
	@RequestMapping("/sign_up_before")
	public ModelAndView signUpBefore(ModelAndView mv) {
		mv.setViewName("sign_up_terms");
		return mv;
	}
	@RequestMapping("/sign_up")
	public ModelAndView signUp(ModelAndView mv) {
		mv.setViewName("sign_up");
		return mv;
	}
	
	@RequestMapping("/listpage")
	public ModelAndView listpage(ModelAndView mv) {
		mv.setViewName("temp_listpage");

		return mv;
	}
	@RequestMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		mv.setViewName("temp_login");
		return mv;
	}
	@RequestMapping("/findId")
	public ModelAndView findId(ModelAndView mv) {
		mv.setViewName("find_id");
		return mv;
	}
	@RequestMapping("/findPw")
	public ModelAndView findPw(ModelAndView mv) {
		mv.setViewName("find_pw");
		return mv;
	}
	@RequestMapping("/password_reset")
	public ModelAndView passwordReset(ModelAndView mv,String id) {
		mv.addObject("id",id);
		mv.setViewName("password_reset");
		return mv;
	}
	@RequestMapping("/test_purchase")
	public ModelAndView testPurchase(ModelAndView mv) {
		List<ProductDto> dtos=new ArrayList<>();
		/*
		 * dtos.add(new ProductDto(1, 1, 11, 11000, 2, "222", 4, 2323, 222, "테스트",
		 * "침대")); dtos.add(new ProductDto(2, 1, 12, 12000, 2, "222", 4, 2323, 222,
		 * "테스트", "수납")); dtos.add(new ProductDto(3, 1, 21, 21000, 2, "222", 4, 2323,
		 * 222, "테스트", "침구"));
		 */
		mv.addObject("products", dtos);
		mv.setViewName("purchase");
		return mv;
	}
	
	
	
	
}
