package teamproject.ssja.service.Board;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardCategoryDto;

@Slf4j
@SpringBootTest
class BoardServiceTest {

	@Autowired
	BoardService boardService;
	
	@Test
	void testShowBoardCategorys() {
		for(BoardCategoryDto dto : boardService.showBoardCategorys()) {
			log.info("BS BC dto : " + dto);
		}
	}

	@Test
	void testAddBoard() {
		fail("Not yet implemented");
	}

	@Test
	void testRemoveBoard() {
		fail("Not yet implemented");
	}

	@Test
	void testShowContent() {
		fail("Not yet implemented");
	}

	@Test
	void testModifyBoard() {
		fail("Not yet implemented");
	}

	@Test
	void testUpHit() {
		fail("Not yet implemented");
	}

	@Test
	void testSetCookie() {
		fail("Not yet implemented");
	}

	@Test
	void testGetCookieValue() {
		fail("Not yet implemented");
	}

	@Test
	void testGetTotal() {
		fail("Not yet implemented");
	}

	@Test
	void testShowListWithPaging() {
		fail("Not yet implemented");
	}

	@Test
	void testModifyGetBoardLikes() {
		fail("Not yet implemented");
	}

}
