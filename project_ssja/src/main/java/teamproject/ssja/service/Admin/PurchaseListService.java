package teamproject.ssja.service.Admin;

import java.util.List;

import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.page.Criteria;

public interface PurchaseListService {
	long getPerchaseListTotalCount();
	List<PurchaseDto> getPerchaseListWithPaging(Criteria cri);

}
