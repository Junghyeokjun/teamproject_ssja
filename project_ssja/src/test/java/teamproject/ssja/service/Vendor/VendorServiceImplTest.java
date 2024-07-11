package teamproject.ssja.service.Vendor;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class VendorServiceImplTest {

	@Autowired
	VendorService vendorService;
	
	@Test
	void testGetVendor() {
		//("vender : " + vendorService.getVendor(25));		
	}

}
