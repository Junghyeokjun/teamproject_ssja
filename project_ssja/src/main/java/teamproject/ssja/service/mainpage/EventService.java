package teamproject.ssja.service.mainpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.event.EventInfoDTO;
import teamproject.ssja.dto.event.EventPageDTO;
import teamproject.ssja.mapper.EventMapper;

@Service
public class EventService {
	@Autowired
	EventMapper eventMapper;
	
	public List<EventInfoDTO> getEventList(){
		List<EventInfoDTO> eventList = eventMapper.getEventList();
		return eventList;
	}
	
	public EventPageDTO getEventPageInfo(int num) {
		return eventMapper.getEventInfoToPage(num);
	}

}
