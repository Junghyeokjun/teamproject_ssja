package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import teamproject.ssja.dto.OrdersDto;
import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDetailReplyDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductDetailTotalInfoDTO;
import teamproject.ssja.dto.product.ProductReviewDTO;
import teamproject.ssja.page.Criteria;

@Mapper
public interface ProductDetailMapper {
	
	ProductDetailDto read(long PRO_NO);
	
	List<ProductDetailReplyDto> readReply(long PRO_NO);

	long getTotalCount(long PRO_NO);

	List<ProductDetailReplyDto> getListWithPaging(Criteria cri);
	//하나의 상품을 가져오는 메서드
	ProductDto getProduct(long PRO_NO);
	
	ProductDto getCartProduct(long PRO_NO,long M_NO);

	
	//구매한 상품의 갯수를 차감하는 메서드
	int updateProductQuantity (OrdersDto order);
	
	List<ProductReviewDTO> getItemsReview(Long productNum,int pageNum );
	
	ProductDetailTotalInfoDTO getProductDetailInfo(Long productNum);
	
	@Update("update product set pro_hit = pro_hit + 1 where pro_no = #{productNum}")
	void addCountViewProduct(Long productNum);
	
	//상품 삭제상태로 하는 
	void deleteStateItem(Long productNum);
}

