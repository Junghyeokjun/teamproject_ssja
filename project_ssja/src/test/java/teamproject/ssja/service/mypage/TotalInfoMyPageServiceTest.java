package teamproject.ssja.service.mypage;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.mapper.totalInfoMyPageMapper;

@SpringBootTest
@Slf4j
class TotalInfoMyPageServiceTest {

	@Autowired
	TotalInfoMyPageService totalService;
	@Autowired
	totalInfoMyPageMapper totalMapper;
	@Test
	void test() {
		long id = 1;
		int pageNum =1;
		int count = totalMapper.getMyPurchaseCount(id);
		List<PurchaseDto> list = totalMapper.getMyPurchaseList(id, pageNum);
		assertNotNull(count);
		assertNotNull(list);
		
	}

}
