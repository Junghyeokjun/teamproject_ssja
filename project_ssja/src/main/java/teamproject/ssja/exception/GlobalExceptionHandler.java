package teamproject.ssja.exception;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@ControllerAdvice
public class GlobalExceptionHandler {
	
	
	@ExceptionHandler(value = {UsernameNotFoundException.class, UnMatchedPasswordException.class})
	public String handleUnMatchPw(Exception e){
		
		if(e instanceof UsernameNotFoundException) {
			log.info("아이디 안맞음");
            return "redirect:/login?error=U";
		}else if(e instanceof UnMatchedPasswordException) {
			 log.info("비밀번호 안맞음");
	            return "redirect:/login?error=P";
		} else {
            return "error"; 
        }
	}

}
