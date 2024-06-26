package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.StatisticVO;
import teamproject.ssja.dto.VendorSalesDto;
import teamproject.ssja.page.Criteria;

@SpringBootTest
@Slf4j
class VendorMapperTest3 {

	@Autowired
	VendorMapper vendorMapper;
	
	@Test
	void testSelectVendor() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectVendorProducts() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectVendorProductsCount() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectVendorSalesInWeek() {
		fail("Not yet implemented");
	}
	
	@Test
	void testSelectVendorSalesInDay() {
		StatisticVO statisticVO = new StatisticVO(1, "2024-06");
		for(VendorSalesDto dto : vendorMapper.selectVendorSalesInDay(statisticVO)) {
			log.info("dto : " + dto);
		}
	}

	@Test
	void testSelectVendorSalesInMonth() {
		StatisticVO statisticVO = new StatisticVO(1, "2024");
		for(VendorSalesDto dto : vendorMapper.selectVendorSalesInMonth(statisticVO)) {
			log.info("dto : " + dto);
		}
	}

	@Test
	void testSelectVendorSalesInYear() {
		StatisticVO statisticVO = new StatisticVO(1, "2024");
		for(VendorSalesDto dto : vendorMapper.selectVendorSalesInYear(statisticVO)) {
			log.info("dto : " + dto);
		}
	}
	
	@Test
	void testSelectVendorSalesTotal() {
		
		log.info("1번 판매자 totals : " + vendorMapper.selectVendorSalesTotal(1));
	}

	@Test
	void testSelectInsertedProNum() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertProduct() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertProductImgs() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectVendorQnas() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectVendorQnaCount() {
		fail("Not yet implemented");
	}

	@Test
	void testGetVendorItemList() {
		fail("Not yet implemented");
	}

	@Test
	void testGetVendorInfoEtc() {
		fail("Not yet implemented");
	}

	@Test
	void testGetVendorInfoCommu() {
		fail("Not yet implemented");
	}
	
	@Test
	void testSelectSearchVendorQnas() {
		Criteria criteria = new Criteria();
		criteria.setBcno(20);
		criteria.setBmno(1);
		for(BoardDto dto : vendorMapper.selectSearchVendorQnas(criteria, "title", "Test")) {
			log.info("" + dto);
		}
	}
	
	@Test
	void testSelectSearchVendorQnaCount() {
		Criteria criteria = new Criteria();
		criteria.setBcno(20);
		criteria.setBmno(1);
		
		log.info("검색 결과 개수 : " + vendorMapper.selectSearchVendorQnaCount(criteria,"title", "Test"));
	}
}
