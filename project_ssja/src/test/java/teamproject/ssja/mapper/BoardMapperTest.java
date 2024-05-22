package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.page.Criteria;

@Slf4j
@SpringBootTest
class BoardMapperTest {
	
	@Autowired
	BoardMapper boardMapper;

//	@Test
//	void testSelectList() {
//		for (BoardDto dto : boardMapper.selectList()) {
//			log.info("dto : " + dto);
//		}
//	}

	@Test
	void testInsertBoard() {
		BoardDto boardDto = new BoardDto();
		boardDto.setBmno(1);
		boardDto.setBbcno(98);
		boardDto.setBwriter("testmember");
		boardDto.setBtitle("test?");
		boardDto.setBcontent("test!");
		boardMapper.insertBoard(boardDto);
		Criteria criteria = new Criteria(); 
		for (BoardDto dto : boardMapper.selectListWithPaging(criteria)) {
			if (dto.getBno() > 200)
				log.info("dto : " + dto);
		}
	}

	@Test
	void testDeleteBoard() {
		Criteria criteria = new Criteria(); 
		for (BoardDto dto : boardMapper.selectListWithPaging(criteria)) {
			log.info("dto : " + dto);
		}

		BoardDto boardDto = new BoardDto();
		boardDto.setBno(203);
		boardMapper.deleteBoard(boardDto);

		for (BoardDto dto : boardMapper.selectListWithPaging(criteria)) {
			log.info("dto : " + dto);
		}
	}

	@Test
	void testRead() {
		log.info("this dto : " + boardMapper.read(140));
	}

	@Test
	void testUpdateBoard() {
		BoardDto boardDto = new BoardDto();
		boardDto.setBno(205);
		boardDto.setBtitle("바꾼것");
		boardDto.setBcontent("바꿨지롱?!");

		boardMapper.read(205);
		boardMapper.updateBoard(boardDto);
		boardMapper.read(205);
	}

	@Test
	void testUpdateHit() {
		boardMapper.read(205);
		boardMapper.updateHit(205);
		boardMapper.read(205);
	}

	@Test
	void testUpdateBLikeUp() {
		fail("Not yet implemented");
	}

	@Test
	void testUpdateBLikeDown() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectTotalCount() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectListWithPaging() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectBoardLikes() {
		long likes = boardMapper.selectBoardLikes(205);
		assertNotNull(likes);
		log.info("205번 게시글 좋아요 수 : " + likes);
	}
}
