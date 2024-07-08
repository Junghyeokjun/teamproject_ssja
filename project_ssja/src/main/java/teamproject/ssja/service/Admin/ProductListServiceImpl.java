package teamproject.ssja.service.Admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductReviewsDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductReviewReplyDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
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

	@Override
	public List<ProductsSearchDto> getProductsSearchList(String type, String keyword) {
		log.info("getProductsSearchList()..");

		return adminPageMapper.getProductsSearchList(type,keyword);
	}

	@Override
	public ProductDto getProductId(int productId) {
        return adminPageMapper.readProductId(productId); 
	}

	@Override
	public void modifyProduct(ProductDto productDto) {
        adminPageMapper.updateProduct(productDto); 		
	}	
	
	@Override
	public void removeProduct(ProductDto productDto) {
    	adminPageMapper.deleteProduct(productDto); 		
	}

	@Override
	public int addProduct(ProductDto productDto) {
		
		return adminPageMapper.insertAdminProduct(productDto);
	}

	@Override
	public List<ProductReviewsDto> getReviewsByProductId(int productId) {
		return adminPageMapper.getReviewsByProductId(productId);
	}

	@Override
	public List<ProductReviewReplyDto> getReplyReviewsByProductId(int productId) {
		return adminPageMapper.getReplyReviewsByProductId(productId);

	}

	@Override
	public int removeReviewProduct(ProductReviewsDto productReviewsDto) {
		log.info("deleteReviewProduct()..");
		return adminPageMapper.deleteReviewProduct(productReviewsDto); 			
	}

	@Override
	public int removeReplyReviewProduct(ProductReviewReplyDto productReviewReplyDto) {
		log.info("deleteReplyReviewProduct()..");
		return adminPageMapper.deleteReplyReviewProduct(productReviewReplyDto); 			
	}	
	
}
