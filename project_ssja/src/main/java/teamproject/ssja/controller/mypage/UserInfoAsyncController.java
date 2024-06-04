package teamproject.ssja.controller.mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.http.ResponseEntity.BodyBuilder;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.Getter;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.LoginChecker;
import teamproject.ssja.dto.email.MailDTO;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.ChangePasswordForm;
import teamproject.ssja.dto.userinfo.MyPageOrdersDTO;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
import teamproject.ssja.page.ListObjectPagingDTO;
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
	public ResponseEntity<UserInfoDTO> myPageUser(@AuthenticationPrincipal CustomPrincipal userDetails) {
		
		long userId = 0L;
			
			userId = userDetails.getMemberNum();
			
				UserInfoDTO userInfo = myPageService.getUserInfo(userId);
				if(userDetails.isOAuth2User()) {
					userInfo.setAuth("social");
				}else {
					userInfo.setAuth("member");
					
				}
				
				return ResponseEntity.ok().body(userInfo);
		
		
	}

	@PostMapping("/address")
	public ResponseEntity<AddressForm> changAddress(@AuthenticationPrincipal CustomPrincipal userDetails,
											@RequestBody AddressForm addressForm,HttpServletRequest request, HttpServletResponse response) {
		
		long userId = userDetails.getMemberNum();
		
		
		addressForm.setUserId(userId);
		
		myPageService.changeAddress(addressForm);
		
		return ResponseEntity.ok().body(addressForm);
	}
	
	 @PostMapping("/password-change")
	    public ResponseEntity<String> changePassword(@AuthenticationPrincipal CustomPrincipal userDetails, 
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
	 public ResponseEntity<String> deleteUserEnroll(@AuthenticationPrincipal CustomPrincipal userDetails){
		 long userId= userDetails.getMemberNum();
		 
		 log.info("{} 유저 삭제 요청",userId);
		String EnrollDeleteDate= myPageService.deleteUserEnroll(userId);
	
		 log.info("삭제 등록 날짜 {}",EnrollDeleteDate);
	            return ResponseEntity.ok(EnrollDeleteDate);
	      
	 }
	 
	 @PostMapping("/email/auth")
	 public ResponseEntity<MailDTO> requestEmailAuth(@RequestBody MailDTO email) {
		 
		 log.info("email {}", email);
		 
		 MailDTO autheticatedMail = mailService.CreateMailRequestAuth(email);
		 log.info("autheticatedMail{}",autheticatedMail);
		 
		 return ResponseEntity.ok().body(autheticatedMail);
	 }

	 
	 @PatchMapping("/email")
	 public ResponseEntity<String> chagneEmail(@RequestBody String email,@AuthenticationPrincipal CustomPrincipal userDetails){
		 int check =LoginChecker.check();
		 String userId = "";
		if(userDetails != null && !userDetails.isOAuth2User()) {
			 userId = userDetails.getUsername();
		}else if(userDetails != null && userDetails.isOAuth2User()) {
			 userId = userDetails.getEmail();
		}
		 myPageService.modifyUserEmail(email, userId);
		 return ResponseEntity.ok("seccess chang email!!");
	 }
	 
	 @PostMapping("/info/orders")
	 public ResponseEntity<MyPageOrdersDTO> getOrderInfo(@AuthenticationPrincipal CustomPrincipal user, int pageNum){
		 MyPageOrdersDTO ordersInfo = myPageService.getPurchaseData(user.getMemberNum(),pageNum);
		 
		 
		 return ResponseEntity.ok(ordersInfo);
		 
	 }
	 
	 @PostMapping("/email/check")
	 public ResponseEntity<String> checkAndAuthorizeEmail(@RequestBody MailDTO email){
		 boolean resultCheck = myPageService.checkEMail(email.getReceiver());
		 
		 if(resultCheck) {
			 MailDTO autheticatedMail = mailService.CreateMailRequestAuth(email);
			 return ResponseEntity.ok(autheticatedMail.getAuthNum());
			 
		 }else {
	         return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Failed");
		 }
	 }
	 @GetMapping("/bizname/check-duplicate")
	 public ResponseEntity checkDuplicateBizname(@RequestParam String bizName) {
		 
		if( myPageService.checkDuplicatedBizname(bizName)) {
			return ResponseEntity.ok(bizName);
			
		}else {
			return ResponseEntity.badRequest().body(bizName);
				
		}
	 }
	 
	 @PostMapping("/info/apply-vendor")
	 public ResponseEntity enrollVendor(@RequestBody VendorInfoDTO venderInfo) {
		 log.info("vendor INfo{}", venderInfo);
		 try {
			
			 myPageService.enrollVendor(venderInfo);
			 return ResponseEntity.ok("success");
		} catch (Exception e) {
			e.printStackTrace();
		      return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Failed");
		}
		 
	 }
	 
	 @PostMapping("/info/vendor")
	 public ResponseEntity<VendorInfoDTO> getVendorInfo() {
		VendorInfoDTO vendorInfo =  myPageService.getVendorInfo();
		 return ResponseEntity.ok(vendorInfo);
	 }
	 
	 @GetMapping("/check/apply-vendor")
	 public ResponseEntity<String> enrollVendor() {
		 int whetherApply =  myPageService.isAppliedVendor();
		 if(whetherApply >= 1) {
			 return ResponseEntity.ok("Y");
		 }else {
			 return ResponseEntity.ok("N");
		 }
	 }
	 
	 @GetMapping("/cart/items")
	 public ResponseEntity<ListObjectPagingDTO> itemCartPage(int pageNum){
		 
		 ListObjectPagingDTO data = myPageService.getcartItems(pageNum);
		 if(data == null) {
			 
			 return ResponseEntity.ok(null);
		 }else {
			 
			 return ResponseEntity.ok(data);
		 }
	 }
 
}
