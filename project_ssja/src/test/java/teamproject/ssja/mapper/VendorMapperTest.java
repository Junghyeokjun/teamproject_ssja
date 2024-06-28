package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.assertj.core.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductImgDto;
import teamproject.ssja.dto.StatisticVO;
import teamproject.ssja.dto.VendorSalesDto;
import teamproject.ssja.dto.vendor.VendorProfitDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.service.Vendor.VendorService;

@SpringBootTest
@Slf4j
class VendorMapperTest {
	
	@Autowired
	VendorMapper vendorMapper;
	@Autowired
	VendorService vendorService;

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
	void testInsertProductImgs() {
		vendorMapper.insertProductImgs(new ProductImgDto(1, 3013, "3"));
	}

	@Test
	void testSelectVendorSalesInWeek() {

		
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
	
	@Test
	@DisplayName("매출 통계 테스트")
	void StatisticTestVendor() {
		String dateCondition="YYYY-MM-DD";
		String condition = "total_sales desc";
		Long vno = 1L;
		List<VendorProfitDTO> data = vendorMapper.getProfitStatistic(vno, dateCondition, condition);
		log.info("data : {}", data);
		assertNotNull(data);
		Map<String, List<VendorProfitDTO>> dataTotal = vendorService.getDataForExcel(vno, condition);
		dataTotal.put("day", vendorMapper.getProfitStatistic(vno, "YY-MM-DD", condition));
		dataTotal.put("month", vendorMapper.getProfitStatistic(vno, "YY-MM", condition));
		dataTotal.put("year", vendorMapper.getProfitStatistic(vno, "YY", condition));
		
		log.info("daily {} ",dataTotal.get("day"));
		log.info("monthly {} ",dataTotal.get("month"));
		log.info("yearly {} ",dataTotal.get("year"));
		Assertions.assertThat(dataTotal.size()).isEqualTo(3);
		
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
	
	@Test
	void testSelectVendorSearchProductsCount() {
		Criteria criteria = new Criteria();
		criteria.setVno(1);
		log.info("검색 결과 개수 : " + vendorMapper.selectVendorSearchProductsCount(criteria, "proPcName", "가구") );
	}

	@Test
	void testSelectVendorSearchProducts() {
		Criteria criteria = new Criteria();
		criteria.setVno(1);
		
		for(ProductDto dto : vendorMapper.selectVendorSearchProducts(criteria, "proPcName", "가구")) {
			log.info("" + dto);
		}
	}
}
