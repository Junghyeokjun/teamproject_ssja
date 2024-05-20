package teamproject.ssja.controller.login;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.logindto.CustomUserDetailsDTO;
import teamproject.ssja.dto.logindto.LoginFormDTO;
import teamproject.ssja.service.user.CustomUserDetailsService;
@Slf4j
@Controller
public class LoginController {
	
	
	
	@RequestMapping("/login")
	public String login() {
		
		return "temp_login";
	}
	
	
	
//	@RequestMapping("/checkUser")
//	public String checkUser(@AuthenticationPrincipal CustomUserDetailsDTO userDetails) {
//		
//		log.info("userDetalis. usename = {}", userDetails.getUsername());
//		
//		
//		 Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
//	        if (authentication != null && authentication.getPrincipal() instanceof CustomUserDetailsDTO) {
//	            CustomUserDetailsDTO userDetails1 = (CustomUserDetailsDTO) authentication.getPrincipal();
//	            log.info("userDetails ={}", userDetails1);
//	        }
//	        log.info("authentication.getAuthorities() {}", authentication.getAuthorities());
//	        log.info("INFO IS NULL?");
//        return "redirect:/home";
//	}
//	
//	@ResponseBody
//	  @GetMapping("/admin")
//	    @PreAuthorize("hasRole('ROLE_ADMIN')")
//	    public String adminPage() {
//	        return "Admin Page";
//	    }

}
