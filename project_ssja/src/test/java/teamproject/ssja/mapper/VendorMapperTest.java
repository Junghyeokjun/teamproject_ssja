package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@SpringBootTest
class VendorMapperTest {

	@Autowired
	VendorMapper vendorMapper;
	
	@Test
	void testSelectVendor() {
		log.info("vender : " + vendorMapper.selectVendor(25));		
	}

}
