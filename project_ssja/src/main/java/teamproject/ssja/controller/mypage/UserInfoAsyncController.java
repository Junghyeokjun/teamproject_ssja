package teamproject.ssja.controller.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.UserRoleAndAuthDTO;
import teamproject.ssja.dto.email.MailDTO;
import teamproject.ssja.dto.logindto.CustomUserDetailsDTO;
import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.ChangePasswordForm;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.service.mypage.MailService;
import teamproject.ssja.service.mypage.MyPageService;
import teamproject.ssja.service.user.CustomUserDetailsService;
@Slf4j
@RestController
@RequestMapping("/user")
public class UserInfoAsyncController {
	
	@Autowired
	MyPageService myPageService;
	@Autowired
	CustomUserDetailsService userService;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	MailService mailService;
	
	@PostMapping("/info")
	public ResponseEntity<UserInfoDTO> myPageUser(@AuthenticationPrincipal CustomUserDetailsDTO userDetails) {
		long userId = userDetails.getUserInfo().getM_No();
		
			
				UserInfoDTO userInfo = myPageService.getUserInfo(userId);
				
				return ResponseEntity.ok().body(userInfo);
		
		
	}

	@PostMapping("/address")
	public ResponseEntity<AddressForm> changAddress(@AuthenticationPrincipal CustomUserDetailsDTO userDetails,
											@RequestBody AddressForm addressForm,HttpServletRequest request, HttpServletResponse response) {
		
		long userId = userDetails.getUserInfo().getM_No();
		
		
		addressForm.setUserId(userId);
		
		myPageService.changeAddress(addressForm);
		
		return ResponseEntity.ok().body(addressForm);
	}
	
	 @PostMapping("/password-change")
	    public ResponseEntity<String> changePassword(@AuthenticationPrincipal UserDetails userDetails, 
	    											@RequestBody ChangePasswordForm changePasswordForm) {
	    	
	        String username = userDetails.getUsername();
	        boolean isChanged = userService.changePasswordProcess(username, changePasswordForm);
	        log.info("isChanged? {}",isChanged);

	        if (isChanged) {
	            return ResponseEntity.ok("success");
	        } else {
	            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Failed");
	        }
	    }
	 
	 @DeleteMapping("")
	 public ResponseEntity<String> deleteUserEnroll(@AuthenticationPrincipal UserDetails userDetails){
		 String username = userDetails.getUsername();
		 
		 log.info("{} 유저 삭제 요청",username);
		String EnrollDeleteDate= myPageService.deleteUserEnroll(username);
	
		 log.info("삭제 등록 날짜 {}",EnrollDeleteDate);
	            return ResponseEntity.ok(EnrollDeleteDate);
	      
	 }
	 
	 @PostMapping("/email/auth")
	 public ResponseEntity<MailDTO> requestEmailAuth(@RequestBody MailDTO email) {
		 
		 log.info("email {}", email.getReceiver());
		 
		 MailDTO autheticatedMail = mailService.CreateMailRequestAuth(email);
		 log.info("autheticatedMail{}",autheticatedMail);
		 
		 return ResponseEntity.ok().body(autheticatedMail);
	 }
	 
	 @PatchMapping("/email")
	 public ResponseEntity<String> chagneEmail(@RequestBody String email){
		 
		 log.info("email = {}",email);
		 return ResponseEntity.ok("seccess chang email!!");
	 }
	 
	 
	 //jwt토큰 때문에 일단 뒤로
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
	 

	 
	/*
	 * //@PostMapping("/password-change") public ResponseEntity<String>
	 * changePasswordTest(@AuthenticationPrincipal UserDetails userDetails,
	 * 
	 * @RequestBody ChangePasswordForm form) { String username =
	 * userDetails.getUsername();
	 * log.info("username {}, currentPW{}, new PW {}",username,form.
	 * getCurrentPassword(),form.getNewPassword()); return
	 * ResponseEntity.ok("success"); }
	 */

}
