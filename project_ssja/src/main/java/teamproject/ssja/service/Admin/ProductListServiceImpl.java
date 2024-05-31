package teamproject.ssja.service.Admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class ProductListServiceImpl implements ProductListService {

	@Autowired
	private AdminPageMapper adminPageMapper;

	@Override
	public long getProductListTotalCount() {
		log.info("getProductListTotalCount()..");
		return adminPageMapper.getProductListTotalCount();
	}

	@Override
	public List<ProductDto> getProductListWithPaging(Criteria cri) {
		log.info("getProductListWithPaging()..");
		return adminPageMapper.getProductListWithPaging(cri);
	}
}
