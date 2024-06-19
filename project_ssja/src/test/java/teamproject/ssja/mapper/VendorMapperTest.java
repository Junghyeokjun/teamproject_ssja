package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductImgDto;
import teamproject.ssja.dto.VendorSalesDto;
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

	@Test
	void testSelectVendorSalesInWeek() {
		
		// 메서드 수정 전, 전체 판매자의 최근 일주일 매출
//		for(VendorSalesDto dto : vendorMapper.selectVendorSalesInWeek()) {
//			log.info("dto : " + dto);
//		}
//		// 판매자 1번의 목록
//		for(VendorSalesDto dto : vendorMapper.selectVendorSalesInWeek(1)) {
//			log.info("dto : " + dto);
//		}
		
		// 판매자 25번의 목록
		for(VendorSalesDto dto : vendorMapper.selectVendorSalesInWeek(25)) {
			log.info("dto : " + dto);
		}
	}
	
	@Test
	void testSelectVendorQnas() {
		Criteria criteria = new Criteria();
		
		// 판매자 데이터
		criteria.setBcno(20);
		criteria.setBmno(25);
		for(BoardDto myQnaList : vendorMapper.selectVendorQnas(criteria)) {
			log.info("myQnaList : " + myQnaList);
		}
	}

}
