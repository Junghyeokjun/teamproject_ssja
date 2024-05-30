package teamproject.ssja.service.Community;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.mapper.BoardMapper;


@Slf4j
@SpringBootTest
class CommunityServiceImplTest {

	@Autowired
	BoardMapper boardMapper;
	
	@Disabled
	@Test
	void notNullTest() {
		assertNotNull(boardMapper);
	}
	
//	@Disabled
	@Test
	void selectCommunityTest() {
		
		for (CommunityBoardDto dto : boardMapper.selectCommunityDto(1,10)) {
			log.info(dto.toString());
		}
	}

}
