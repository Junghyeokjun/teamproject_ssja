package teamproject.ssja.mapper;

import java.util.*;


import teamproject.ssja.dto.mainpage.EventInfoDTO;
import teamproject.ssja.dto.mainpage.EventPageDTO;

public interface EventMapper {
	
	List<EventInfoDTO> getEventList();
	
	EventPageDTO getEventInfoToPage(int eventNum);

}
