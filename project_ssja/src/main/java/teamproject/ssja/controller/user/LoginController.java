package teamproject.ssja.controller.user;

import java.util.DuplicateFormatFlagsException;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.exception.DuplicateEmailException;

@Slf4j
@Controller
public class LoginController {
	
	
	
	@RequestMapping("/login")
	public String login(RedirectAttributes attr) {
		try {
			
		return "temp_login";
		}catch(DuplicateEmailException eEmail) {
			
			attr.addAttribute("errorcode","DuplicateEmailException");
		return "redirect:/login";	
		}
	}
	
	
//	@RequestMapping("/checkUser")
//	public String checkUser(@AuthenticationPrincipal CustomUserDetailsDTO userDetails) {
//		
//		log.info("userDetalis. usename = {}", userDetails.getUsername());
//		log.info("mNUm = {}", userDetails.getUserInfo().getM_No());
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
