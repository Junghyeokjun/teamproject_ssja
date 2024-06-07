package teamproject.ssja.service.Admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class PurchaseListServiceImpl implements PurchaseListService {

	@Autowired
	private AdminPageMapper adminPageMapper;

	@Override
	public long getPerchaseListTotalCount() {
		log.info("getPerchaseListTotalCount()..");
		return adminPageMapper.getPerchaseListTotalCount();
	}

	@Override
	public List<PurchaseDto> getPerchaseListWithPaging(Criteria cri) {
		log.info("getPerchaseListWithPaging()..");
		return adminPageMapper.getPerchaseListWithPaging(cri);
	}
}
