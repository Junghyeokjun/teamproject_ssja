package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductImgDto;
import teamproject.ssja.page.Criteria;

@SpringBootTest
@Slf4j
class VendorMapperTest {
	
	@Autowired
	VendorMapper vendorMapper;
	
	@Test
	void testSelectVendor() {
		log.info("vendor : " + vendorMapper.selectVendor(25));		
	}

	@Test
	void testSelectVendorProducts() {
		Criteria criteria = new Criteria();
		criteria.setVno(1);
		for(ProductDto productDto : vendorMapper.selectVendorProducts(criteria)) {
			log.info("products : " + productDto);
		}
	}

	@Test
	void testInsertProduct() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertProductImgs() {
		vendorMapper.insertProductImgs(new ProductImgDto(1, 3013, "3"));
	}

}
