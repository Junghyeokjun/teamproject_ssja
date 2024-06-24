package teamproject.ssja.trace;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface VisitManager {
	 void validVisit( HttpServletRequest request, HttpServletResponse response);
}
