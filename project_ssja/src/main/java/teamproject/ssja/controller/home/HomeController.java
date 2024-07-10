package teamproject.ssja.controller.home;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.mainpage.EventPageDTO;
import teamproject.ssja.mapper.EventMapper;

@Slf4j
@Controller
public class HomeController {
	
	@Autowired
	EventMapper eventMapper;
	
	
	@RequestMapping("/home")
	public String goHomePage() {
		
		
		return "index";
	}
	
	
	/*
	 * @RequestMapping("/logout") public void logoutP() {
	 * 
	 * }
	 */
	 
	
	@GetMapping("/event/page")
	public String eventP(@RequestParam("event") int eventNum,Model model) {
		
		if(eventNum <= 0) return "redirect:/sign/sign_up_before";
			
		
		EventPageDTO evPageInfo = eventMapper.getEventInfoToPage(eventNum);
		model.addAttribute("evPageInfo",evPageInfo);
		
		return "/event/event_page";
	}
	
	@RequestMapping("/link_source")
	public String linkSourceP() {
		
		
		return "/event/link_source";
	}
	@RequestMapping("checksocial")
	public String  sheckSocial(Model model, @AuthenticationPrincipal CustomPrincipal user) {
		String username = "";
		 if (user != null && user.isOAuth2User()) {
	       log.info("사용자는 소셜 로그인 유저입니다.");
	       model.addAttribute("isSocial","소셜로그인 유저");
	       model.addAttribute("snum",user.getMemberNum());
	      
		 }else if(user != null && !user.isOAuth2User()) {
			 
			 log.info("사용자는 세션 로그인 유저입니다.");
			 model.addAttribute("isSocial","세션 로그인 유저");
		 }
		 
		 username= user.getName();
		 
		 model.addAttribute("username", username);
		return "/myPage/checksocial";
	}
	
	@PostMapping("/logout")
	void logoutP() {
		
	}
	@GetMapping("/search")
	public String searchPage(Model model, @RequestParam("keyword") String keyword) {
		log.info("keyword");
		model.addAttribute("keyword", keyword);
		
		return "/product/searchResults";
	}
	
	@RequestMapping("/dupl-login")
	public String duplLogin() {
		return "/duplicateLogin";
	}
}
