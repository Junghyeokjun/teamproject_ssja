package teamproject.ssja.service.Purchase;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.PurchaseDto;

@SpringBootTest
@Slf4j
class PurchaseServiceImplTest {

	@Autowired
	PurchaseService PurchaseService;
	
	@Disabled
	@Test
	void notNullTest() {
		assertNotNull(PurchaseService);
	}
	
	@Disabled
	@Test
	void purchaseTest() {
		PurchaseDto dto=new PurchaseDto(0, 22,10000 ,1000 , 9000, "card", null, "성남","대한통운");
		log.info((PurchaseService.Purchase(dto)+""));
		log.info((dto.getPUR_NO()+""));
	}

}
