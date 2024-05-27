package teamproject.ssja.service.Product;

import java.util.List;

import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDetailReplyDto;
import teamproject.ssja.page.Criteria;

public interface ProductDetailService {

	ProductDetailDto get(long PRO_NO);

	// 페이징 처리 함수
	long getTotal(long PRO_NO);
	List<ProductDetailReplyDto> getListWithPaging(Criteria cri);

}
