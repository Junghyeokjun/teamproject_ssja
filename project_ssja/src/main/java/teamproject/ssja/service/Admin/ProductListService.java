package teamproject.ssja.service.Admin;

import java.util.List;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.page.Criteria;

public interface ProductListService {

	long getProductListTotalCount();
	List<ProductDto> getProductListWithPaging(Criteria cri);

}
