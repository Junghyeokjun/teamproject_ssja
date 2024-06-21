package teamproject.ssja.service.Admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.mapper.AdminPageMapper;

@Service
public class AdminInfoListService {
	
	@Autowired
	private AdminPageMapper adminPageMapper;

	public int getDailyPrice() {
		return adminPageMapper.getDailyPrice();
	}
	
	public int getDailyPurcount() {
		return adminPageMapper.getDailyPurcount();
	}
	
	public int getDailyMcount() {
		return adminPageMapper.getDailyMcount();
	}
	
	public int getDailyQnaCount() {
		return adminPageMapper.getDailyQnaCount();
	}
	
	

	
	
	

}
