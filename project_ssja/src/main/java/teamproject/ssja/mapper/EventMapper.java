package teamproject.ssja.mapper;

import java.util.*;

import org.apache.ibatis.annotations.Select;

import teamproject.ssja.dto.EventInfoDTO;

public interface EventMapper {
	
	List<EventInfoDTO> getEventList();

}
