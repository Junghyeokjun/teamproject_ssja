package teamproject.ssja.service.Admin;

import static org.junit.jupiter.api.Assertions.assertNotNull;

import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import teamproject.ssja.dto.ProfitDto;
import teamproject.ssja.mapper.AdminPageMapper;

@SpringBootTest
class SalesListServiceTest {

	@Autowired
	AdminPageMapper service;
	
	@Test
	void test() {

		
		List<ProfitDto> dailyData = service.totalDailyProfitData();
		List<ProfitDto> monthlyData= service.totalMonthlyProfitData();
		List<ProfitDto> yearlyData = service.totalYearlyProfitData();
		assertNotNull(dailyData);
		assertNotNull(monthlyData);
		assertNotNull(yearlyData);
		
	}

}
