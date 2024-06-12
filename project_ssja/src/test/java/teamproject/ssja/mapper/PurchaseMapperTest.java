package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.userinfo.CouponDTO;

@Slf4j
@SpringBootTest
class PurchaseMapperTest {

	@Autowired
	PurchaseMapper purchaseMapper;
	
	@Disabled
	@Test
	void test() {
		assertNotNull(purchaseMapper);
	}

	@Disabled
	@Test
	void insertPurchaseTest() {
		PurchaseDto dto=new PurchaseDto(0, 22,10000 ,1000 , 9000, "card", null, "성남","대한통운");
		log.info((purchaseMapper.insertPurchase(dto)+""));
		log.info((dto.getPUR_NO()+""));
	}
	
	@Test
	void selectCouponList() {
		for (CouponDTO dto : purchaseMapper.selectOwnCoupons(1)) {
			System.out.println(dto);
		}
	}
	

}
