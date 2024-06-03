package teamproject.ssja.configure.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
@Component
public class CustomAuthenticationFailurHandler implements AuthenticationFailureHandler{
	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, 
    		HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {
        
    	if (e instanceof BadCredentialsException || e instanceof UsernameNotFoundException) {
            redirectStrategy.sendRedirect(request, response, "/login?error=true");
        }
    }

}
