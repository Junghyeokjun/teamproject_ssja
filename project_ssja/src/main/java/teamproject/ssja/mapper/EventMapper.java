package teamproject.ssja.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import teamproject.ssja.dto.event.EventInfoDTO;
import teamproject.ssja.dto.event.EventPageDTO;

public interface EventMapper {
	
	List<EventInfoDTO> getEventList();
	
	EventPageDTO getEventInfoToPage(int eventNum);

}
