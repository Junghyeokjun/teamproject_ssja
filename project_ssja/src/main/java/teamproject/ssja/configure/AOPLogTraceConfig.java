package teamproject.ssja.configure;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import teamproject.ssja.trace.aspect.LogTraceAspect;
import teamproject.ssja.trace.logtrace.LogTrace;
import teamproject.ssja.trace.logtrace.SSJALogTrace;

@Configuration
public class AOPLogTraceConfig {

	
	@Bean
	public LogTraceAspect logTraceAspect(LogTrace logTrace) {
		return new LogTraceAspect(logTrace);
	}
	
	@Bean
	public LogTrace logTrace() {
		return new SSJALogTrace();
	}
}
