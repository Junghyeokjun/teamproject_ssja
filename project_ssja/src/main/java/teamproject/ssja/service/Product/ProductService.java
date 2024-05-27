package teamproject.ssja.service.Product;

import java.util.List;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;

public interface ProductService {

	List<ProductDto> getProductList(ProductCondition condition);
	ProductCondition getTotalItemsCount(ProductCondition condition);
}
