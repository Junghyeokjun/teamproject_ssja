package teamproject.ssja.trace.logtrace;

import teamproject.ssja.trace.TraceStatus;

public interface LogTrace {

	
	TraceStatus begin(String message);
	void end(TraceStatus status);
	void exception(TraceStatus status, Exception e);
}
