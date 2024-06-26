package teamproject.ssja.configure;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.service.aspect.AspectService;
import teamproject.ssja.trace.VisitManager;
import teamproject.ssja.trace.VisitManagerImpl;
import teamproject.ssja.trace.aspect.LogTraceAspect;
import teamproject.ssja.trace.aspect.VisitAspect;
import teamproject.ssja.trace.logtrace.LogTrace;
import teamproject.ssja.trace.logtrace.SSJALogTrace;

@Configuration
@RequiredArgsConstructor
public class AOPConfig {

	private final AspectService aspectService;
	
	@Bean
	public LogTraceAspect logTraceAspect(LogTrace logTrace) {
		return new LogTraceAspect(logTrace);
	}
	
	@Bean
	public LogTrace logTrace() {
		return new SSJALogTrace();
	}
	
	@Bean
	public VisitManager visitManager() {
		
		return new VisitManagerImpl(aspectService);
	}
	
	@Bean
	public VisitAspect visitAspect(VisitManager visitManager) {
		return new VisitAspect(visitManager);
	}
}
