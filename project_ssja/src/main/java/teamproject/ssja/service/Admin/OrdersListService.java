package teamproject.ssja.service.Admin;

import java.util.List;

import teamproject.ssja.dto.OrderDetailsDto;
import teamproject.ssja.dto.OrdersSearchDto;
import teamproject.ssja.page.Criteria;

public interface OrdersListService {
	
	long getOrdersListTotalCount();
	List<OrderDetailsDto> getOrdersListWithPaging(Criteria criteria);
	List<OrdersSearchDto> getOrdersSearchList(String type, String keyword);

}
