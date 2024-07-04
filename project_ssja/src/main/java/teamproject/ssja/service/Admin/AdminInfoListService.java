package teamproject.ssja.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.OrderDetailsDto;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
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

	public List<OrderDetailsDto> getDailyPurList() {
		return adminPageMapper.getDailyPurList();
	}

	public  List<MembersDto> getDailyMList() {
		return  adminPageMapper.getDailyMList();
	}

	public  List<QnaBoardDto> getDailyQnaList() {
		return  adminPageMapper.getDailyQnaList();
	}

	/*
	 * public long getDailyPurListTotalCount() { return
	 * adminPageMapper.getDailyPurListTotalCount(); }
	 * 
	 * public List<OrderDetailsDto> getDailyPurListWithPaging(Criteria cri) {
	 * log.info("getDailyPurListWithPaging().."); return
	 * adminPageMapper.getDailyPurListWithPaging(cri); }
	 */
	
}
