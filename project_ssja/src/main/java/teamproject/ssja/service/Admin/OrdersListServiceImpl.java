package teamproject.ssja.service.Admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import teamproject.ssja.dto.OrderDetailsDto;
import teamproject.ssja.dto.OrdersSearchDto;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Service
public class OrdersListServiceImpl implements OrdersListService {

	@Autowired
	private AdminPageMapper adminPageMapper;	
	
	@Override
	public long getOrdersListTotalCount() {
		return adminPageMapper.getOrdersListTotalCount();
	}

	@Override
	public List<OrderDetailsDto> getOrdersListWithPaging(Criteria criteria) {
		return adminPageMapper.getOrdersListWithPaging(criteria);
	}

	@Override
	public List<OrdersSearchDto> getOrdersSearchList(String type, String keyword) {
		return adminPageMapper.getOrdersSearchList(type,keyword);

	}
}
