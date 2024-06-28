package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.fail;

import java.sql.SQLIntegrityConstraintViolationException;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ReplysDto;

@Slf4j
@SpringBootTest
class ReplyMapperTest {

	@Autowired
	ReplyMapper replyMapper;
	
	@Test
	void testInsertReply(){
		// 예시를 위한 댓글 데이터. 데이터베이스에 실제로 들어갈 땐 sysdate나 sequence를 통해 들어감.
		//ReplysDto replysDto = new ReplysDto(1,100,1,"하나마트","테스트3","",0,0,0,0);
		ReplysDto replysDto = new ReplysDto(1,100,1,"하나마트","댓글을 상당히 길게 적었을 때 모양이 어떻게 되는지 확인은 해야 하기 때문에, 댓글 내용을 길게 적고 나는 그 부분을 체크하여 모양을 다듬는 작업을 할 것이다. 과연 이 텍스트가 아예 의미가 없는지, 아닌지는 두고봐야 할 것이다. 그러나 이 정도의 댓글도 너무 양이 적지 않을까? 그것도 궁금해진다.","",0,0,0,0);
		replyMapper.insertReply(replysDto);
		
		for(ReplysDto dto : replyMapper.selectReplys(209)) {
			log.info("dto : " + dto);
		};
	}
	
	// 대댓글 달기(입력만 있음. 처음만 해당 부분으로 테스트하고, 나머지는 updateshape로 테스트해야 함.)
	// 즉, 이는 disabled를 해둬야 한다. 다른 곳에서 한꺼번에 테스트를 진행할 것.
	@Test
	void testInsertReReply(){
		// 예시를 위한 댓글 데이터. 데이터베이스에 실제로 들어갈 땐 sysdate나 sequence를 통해 들어감.
		// ReplysDto replysDto = new ReplysDto(1,209,1,"하나마트","대충 할래...","2024-05-12",0,1,0,0);
		ReplysDto replysDto = new ReplysDto(2,100,1,"하나마트","대충 할래...","2024-05-12",0,1,0,0);
		
		replyMapper.insertReReply(replysDto);
		
		for(ReplysDto dto : replyMapper.selectReplys(209)) {
			log.info("dto : " + dto);
		};
	}
	
	@Transactional
	@Test
	void testUpdateDuplicatedShape() {
		// ReplysDto replysDto = new ReplysDto(1,209,1,"하나마트","대충 할래...","2024-05-12",0,1,0,0);
		// ReplysDto replysDto = new ReplysDto(1,209,1,"하나마트","대충 할래...","2024-05-12",0,34,0,0);
		// ReplysDto replysDto = new ReplysDto(1,209,1,"하나마트","대충 할래...","2024-05-12",0,35,0,0);
		ReplysDto replysDto = new ReplysDto(1,409,1,"하나마트","대충 할래...","2024-05-12",0,0,0,0);
		Assertions.assertThrows(DataIntegrityViolationException.class, () -> {
		// ReplysDto replysDto = new ReplysDto(1,100,1,"하나마트","대충 할래...","2024-05-12",0,35,0,0);
		replyMapper.updateShape(replysDto);
		replyMapper.insertReply(replysDto);
		
		for(ReplysDto dto : replyMapper.selectReplys(409)) {
			log.info("dto : " + dto);
		};
		});
	}
	
	@Test
	void testUpdateReply() {
	
		ReplysDto replysDto = replyMapper.selectReplys(100).get(0);
		replysDto.setRcontent("바뀌는지 좀 보자꾸나");
			
		replyMapper.updateReply(replysDto);
		
		for(ReplysDto dto : replyMapper.selectReplys(100)) {
			log.info("dto : " + dto);
		};
	}
	
	@Test
	void testSelectReplyCount() {
		log.info("100번 글의 총 댓글 개수 : " + replyMapper.selectReplyCount(100));
	}
	
	@Test
	void testSelectPartReply() {
		log.info(replyMapper.selectPartReplys(1, 20, 11620).toString());
	}
	

	@Test
	void testDeleteAllReply() {
		log.info(replyMapper.deleteAllReply(11619)+"");
	}


	@Test
	void testSelectReply() {
		System.out.println(replyMapper.selectReply(488));
	}

	@Test
	void testSelectReReplyCount() {
		ReplysDto reply= new ReplysDto();
		reply.setRgroup(542);
		reply.setRindent(0);
		reply.setRstep(0);
		System.out.println(reply);
		System.out.println(replyMapper.selectReReplyCount(reply));
	}

}
