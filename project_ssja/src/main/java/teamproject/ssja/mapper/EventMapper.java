package teamproject.ssja.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import teamproject.ssja.dto.EventInfoDTO;
import teamproject.ssja.dto.EventPageDTO;

public interface EventMapper {
	
	List<EventInfoDTO> getEventList();
	
	EventPageDTO getEventInfoToPage(int eventNum);

}
