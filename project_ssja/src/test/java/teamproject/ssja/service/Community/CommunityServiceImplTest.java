package teamproject.ssja.service.Community;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.mapper.BoardMapper;


@Slf4j
@SpringBootTest
class CommunityServiceImplTest {

	@Autowired
	CommunityService communityService;
	
	@Disabled
	@Test
	void notNullTest() {
		assertNotNull(communityService);
	}
	
	@Disabled
	@Test
	void selectCommunityTest() {
		
		for (CommunityBoardDto dto : communityService.getPost(1,10)) {
			log.info(dto.toString());
		}
	}

	@Disabled
	@Test
	void selectCommunityContentTest() {
		
		log.info( communityService.getContent(600).toString());
		
	}
	
	@Disabled
	@Test
	void selectCommunityPartReplyTest() {
		
		for (ReplysDto dto : communityService.getReply(1,20,11620)) {
			log.info(dto.toString());
		}
		
	}
	
	@Disabled
	@Test
	void selectCommunityReplyTotalTest() {
		log.info(communityService.getReplyTotal(11620)+"");
	}
	
	@Disabled
	@Test
	void insertCommunityReplyTest() {
		log.info(communityService.insertReply(new ReplysDto(0, 11620, 21, "test", "test", null, 0, 0, 0, 0))+"");
	}
}
