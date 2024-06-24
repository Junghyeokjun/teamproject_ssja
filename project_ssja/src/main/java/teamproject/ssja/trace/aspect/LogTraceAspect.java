package teamproject.ssja.trace.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.trace.TraceStatus;
import teamproject.ssja.trace.logtrace.LogTrace;

@Aspect
@RequiredArgsConstructor
public class LogTraceAspect {

	private final LogTrace logTrace;
	
	@Around("execution(* teamproject.ssja.controller..*(..)) ||"
			+ "execution(* teamproject.ssja.service..*(..)) ||"
			+ "execution(* teamproject.ssja.mapper..*(..))")
	public Object execute(ProceedingJoinPoint joinPoint) throws Throwable{
		
		TraceStatus status = null;
		try {
			
			String message = joinPoint.getSignature().getDeclaringType().getSimpleName() + "." +
							joinPoint.getSignature().getName();
			status = logTrace.begin(message);
			
			Object result = joinPoint.proceed();
			
			logTrace.end(status);
			return result;
		}catch(Exception e){
			logTrace.exception(status, e);
			throw e;
		}
	
	}
	
	
}
