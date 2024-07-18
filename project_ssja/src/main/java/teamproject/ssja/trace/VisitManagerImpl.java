package teamproject.ssja.trace;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.service.aspect.AspectService;

@Slf4j
@RequiredArgsConstructor
public class VisitManagerImpl implements VisitManager{
	
	private final AspectService aspectService;
	
	//방문 쿠키 체크 또는 발급 [0]으로 지정
	@Override
	public void validVisit( HttpServletRequest request, HttpServletResponse response) {
		Cookie beforeCookie = null;
		
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			 for (Cookie cookie : cookies) {
	                if (cookie.getName().equals("visit")) {
	                	beforeCookie = cookie;
	                }
	            }
		}
		if (beforeCookie != null) {
            if (!beforeCookie.getValue().contains("Y")) {
            	beforeCookie.setValue(beforeCookie.getValue() + "Y");
            	aspectService.addVisitCount();
            	beforeCookie.setPath("/");
            	beforeCookie.setMaxAge(expireToTodaySeconds());
            	beforeCookie.setHttpOnly(true);
            	response.addCookie(beforeCookie);
            	return;
            }
            
            return;
        } else {
            Cookie newCookie = new Cookie("visit","Y");
          	aspectService.addVisitCount();
            newCookie.setPath("/");
            newCookie.setMaxAge(expireToTodaySeconds());
            newCookie.setHttpOnly(true);
            response.addCookie(newCookie);
            return;
        }
	}
	  private int expireToTodaySeconds() {
	        LocalDateTime now = LocalDateTime.now();
	        LocalDateTime endOfDay = now.toLocalDate().atTime(23, 59, 59);
	        long seconds = ChronoUnit.SECONDS.between(now, endOfDay);
	        return (int)seconds+1;
	    }
}
