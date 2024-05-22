package teamproject.ssja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.service.TestService;

@Controller
@RestController
@RequestMapping("/testrest")
public class TestRestController {
	
	@Autowired
	TestService testService;
	
//	패스워드 엔코더 추가후
//	@Autowired 
//	PasswordEncoder passwordEncoder;


	@GetMapping("/idCheck")
	public boolean idCheck(String id) {
		System.out.println(111);
		return testService.idCheck(id);
	}
	
	@GetMapping("/nameCheck")
	public boolean nameCheck(String name) {
		System.out.println(222);
		return testService.nameCheck(name);
	}
	
	@PostMapping("/signUp")
	public boolean signUp(MembersDto member,String email, String domain) {
//		패스워드 엔코더 추가후
//		member.setM_PW(passwordEncoder.encode(member.getM_PW()));
		System.out.println(member);
		member.setM_EMAIL(email+"@"+domain);
		return testService.signUp(member);
		
	}

}
