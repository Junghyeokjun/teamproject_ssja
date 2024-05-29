package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.AuthDto;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.OrdersDto;
import teamproject.ssja.dto.PurchaseDto;

@Slf4j
@SpringBootTest
class OrdersMapperTest {

	@Autowired
	OrdersMapper ordersMapper;

	@Disabled
	@Test
	void test() {
		assertNotNull(ordersMapper);
	}
	
	@Disabled
	@Test
	void insertOrdersTest() {
		OrdersDto order= new OrdersDto(0, 15, 3899, 2, 0, 0, 0,0, "결제완료");
		log.info(ordersMapper.insertOrder(order)+"");
		
	}
	
	
}
