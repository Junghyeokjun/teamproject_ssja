package teamproject.ssja.service.Admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.ProfitDto;
import teamproject.ssja.mapper.AdminPageMapper;

@Service
public class SalesListService {
	
	@Autowired
	private AdminPageMapper adminPageMapper;

	public List<Map<String, Object>> getDailySales() {
		return adminPageMapper.getDailySalesList();
	}
	
	public List<Map<String, Object>> getWeeklySales() {
		return adminPageMapper.getWeeklySalesList();
	}

	public List<Map<String, Object>> getMonthlySales() {
		return adminPageMapper.getMonthlySalesList();
	}

	public List<Map<String, Object>> getYearlySales() {
		return adminPageMapper.getYearlySalesList();
	}

	public ProfitDto getSalesDataByDate() {
		return adminPageMapper.getSalesDataByDate();
	}

	public List<Map<String, Object>> dailyMCounts() {
		return adminPageMapper.dailyMCountsList();
	}

	public List<Map<String, Object>> dailyVCounts() {
		return adminPageMapper.dailyVisitCountsList();
	}
	
	public Map<String, List<ProfitDto>> totalProfit(){
		
		Map<String, List<ProfitDto>> data = new HashMap<>();
		data.put("daily",adminPageMapper.totalDailyProfitData());
		data.put("monthly",adminPageMapper.totalMonthlyProfitData());
		data.put("yearly",adminPageMapper.totalYearlyProfitData());
		return data;
	}
	
}
