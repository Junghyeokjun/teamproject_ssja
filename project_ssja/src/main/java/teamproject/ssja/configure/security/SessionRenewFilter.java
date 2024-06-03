package teamproject.ssja.configure.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;

@Component
public class SessionRenewFilter implements Filter{

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request2 = (HttpServletRequest) request;
		HttpSession session = request2.getSession(false);
		
		if(session != null) {
			
			session.setMaxInactiveInterval(7200);
		}
		chain.doFilter(request, response);
		
	}

	

}
