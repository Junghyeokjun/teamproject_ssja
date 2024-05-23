package teamproject.ssja.service.event;

import java.util.*;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.EventInfoDTO;
import teamproject.ssja.mapper.EventMapper;
@Slf4j
@Transactional
@SpringBootTest
class EventServiceTest {
	
	@Autowired
	EventService eventService;
	@Autowired
	EventMapper eventMapper;
	//@Disabled
	@Test
	void eventListTest() {
		List<EventInfoDTO> eventList = eventService.getEventList();
		
		for (EventInfoDTO eventInfoDTO : eventList) {
			log.info("eventInfoDTO {} ", eventInfoDTO);
		}
		
		Assertions.assertThat(eventList.size()).isEqualTo(3);
	}
	//@Disabled
	@Test
	void eventListMapperTest() {
		List<EventInfoDTO> eventList = eventMapper.getEventList();
		
		for (EventInfoDTO eventInfoDTO : eventList) {
			log.info("eventInfoDTO {} ", eventInfoDTO);
		}
		
		Assertions.assertThat(eventList.size()).isEqualTo(3);
	}

}
