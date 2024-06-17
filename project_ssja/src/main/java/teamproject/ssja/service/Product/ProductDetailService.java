package teamproject.ssja.service.Product;

import java.util.List;

import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDetailReplyDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductDetailTotalInfoDTO;
import teamproject.ssja.dto.product.ProductReviewDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.ListObjectPagingDTO;

public interface ProductDetailService {

	ProductDetailDto get(long PRO_NO);

	// 페이징 처리 함수
	long getTotal(long PRO_NO);
	List<ProductDetailReplyDto> getListWithPaging(Criteria cri);
	
	ListObjectPagingDTO getItemsReview(Long productNum, Integer pageNum);

	ProductDetailTotalInfoDTO getProductDetailInfo(Long productNum);
	void addCountViewProduct(Long productNum);
}
