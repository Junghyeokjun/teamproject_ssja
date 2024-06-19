package teamproject.ssja.service.Admin;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.mapper.AdminPageMapper;

@Service
public class SalesListService {
	
	@Autowired
	private AdminPageMapper adminPageMapper;

	public List<Map<String, Object>> getDailySales() {
		return adminPageMapper.getDailySalesList();
	}

	public List<Map<String, Object>> getMonthlySales() {
		return adminPageMapper.getMonthlySalesList();
	}

	public List<Map<String, Object>> getYearlySales() {
		return adminPageMapper.getYearlySalesList();
	}
	
	public Map<String, Object> getSalesDataByDate(String date) {
        return adminPageMapper.getSalesDataByDate(date);
    }

}
