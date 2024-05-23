package teamproject.ssja.service.Product;

import java.util.List;

import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDetailReplyDto;

public interface ProductDetailService {	

	ProductDetailDto get(long PRO_NO);
	
	List<ProductDetailReplyDto> getReply(long PRO_NO);

	
}

