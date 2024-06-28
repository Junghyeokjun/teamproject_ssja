package teamproject.ssja.service.Admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductsSearchDto;
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
	
}
