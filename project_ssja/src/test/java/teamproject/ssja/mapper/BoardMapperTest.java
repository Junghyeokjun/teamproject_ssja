package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

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

	@Transactional
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
		BoardDto dto = boardMapper.read(130);
		log.info("dto's like before up : " + dto.getBlike());
		boardMapper.updateBLikeUp(dto.getBno());
		
		dto = boardMapper.read(130);
		log.info("dto's like up after : " + dto.getBlike());		
	}

	@Test
	void testUpdateBLikeDown() {
		BoardDto dto = boardMapper.read(130);
		log.info("dto's like before down : " + dto.getBlike());
		boardMapper.updateBLikeDown(dto.getBno());
		
		dto = boardMapper.read(130);
		log.info("dto's like down after : " + dto.getBlike());	
	}

	@Test
	void testSelectTotalCount() {
		log.info("총 게시글 수는 " + boardMapper.selectTotalCount(20) + "개입니다.");
	}

	@Test
	void testSelectListWithPaging() {
		// 기본 criteria : 1페이지에 출력되는 10개  
		for(BoardDto dto : boardMapper.selectListWithPaging(new Criteria())) {
			log.info("dto : " + dto);
		}
	}

	@Test
	void testSelectBoardLikes() {
		long likes = boardMapper.selectBoardLikes(205);
		assertNotNull(likes);
		log.info("205번 게시글 좋아요 수 : " + likes);
	}
}
