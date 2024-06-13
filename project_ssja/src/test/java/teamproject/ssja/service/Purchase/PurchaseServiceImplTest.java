package teamproject.ssja.service.Purchase;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

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
		Map<String, Object> data=new HashMap<String, Object>();
		data.put("M_NO", "21");
		data.put("PUR_TOT", "1000");
		data.put("PUR_DC", "1000");
		data.put("PUR_PAY", "0");
		data.put("PUR_PAYMENT", "discount");
		data.put("PUR_DVADDRESS", "테스트");
		data.put("PUR_DV", "대한통운");
		data.put("USE_POINT", "1000");
		data.put("products[0][product_no]", "3899");
		data.put("products[0][quantity]", "2");
		data.put("products[0][discount]", "1000");
		data.put("products[0][price]", "1000");
		data.put("products[0][pay]", "0");
		data.put("products[0][coupon]", "0");
		data.put("products[1][product_no]", "3899");
		data.put("products[1][quantity]", "2");
		data.put("products[1][discount]", "1000");
		data.put("products[1][price]", "1000");
		data.put("products[1][pay]", "0");
		data.put("products[1][coupon]", "0");
		System.out.println(PurchaseService.Purchase(data));
	}
	
	@Test
	void itemPurchaseTest() {
		List<Integer> list=new ArrayList<Integer>();
		list.add(3244);
		list.add(3556);
		System.out.println(PurchaseService.getProducts(list, 1));
	}
	
}