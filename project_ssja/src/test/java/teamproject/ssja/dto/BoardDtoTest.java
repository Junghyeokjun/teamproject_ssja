package teamproject.ssja.dto;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class BoardDtoTest {

	@Test
	void test() {
		BoardDto dto = new BoardDto();
		assertNotNull(dto);
		log.debug("dto " + dto);
	}

}
