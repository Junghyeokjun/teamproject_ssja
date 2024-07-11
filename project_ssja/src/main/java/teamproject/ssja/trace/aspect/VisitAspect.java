package teamproject.ssja.trace.aspect;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.trace.VisitManager;

@Slf4j
@Aspect
@RequiredArgsConstructor
public class VisitAspect {
	
	
	private final VisitManager visitManager;

	@Around("execution(* teamproject.ssja.controller..*(..)) &&"
			+ " @within(org.springframework.stereotype.Controller) &&"
			+ "!within(teamproject.ssja.controller.CustomErrorController)" + 
			 "!@annotation(org.springframework.web.bind.annotation.ResponseBody)")
	public Object execute(ProceedingJoinPoint joinPoint) throws Throwable {
		try {
			HttpServletRequest request =((ServletRequestAttributes) 
					 RequestContextHolder.getRequestAttributes()).getRequest();
		     HttpServletResponse response =((ServletRequestAttributes) 
		    		 RequestContextHolder.getRequestAttributes()).getResponse();
		     visitManager.validVisit(request, response);
			Object result = joinPoint.proceed();
			
			return result;	
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		 
		
	}
}
	
	
