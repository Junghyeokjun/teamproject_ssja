package teamproject.ssja.trace;

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
            	beforeCookie.setMaxAge(60 * 60 * 24);
            	response.addCookie(beforeCookie);
            	log.info("방문쿠키 추가");
            	return;
            }
            
            log.info("이미 방문");
            return;
        } else {
            Cookie newCookie = new Cookie("visit","Y");
          	aspectService.addVisitCount();
            newCookie.setPath("/");
            newCookie.setMaxAge(60 * 60 * 24);
            response.addCookie(newCookie);
            log.info("방문 쿠키 생성");
            return;
        }
	}
}
