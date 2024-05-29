package teamproject.ssja.service.Product;

import java.util.List;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.dto.product.ProductItemDto;

public interface ProductService {

	List<ProductItemDto> getProductList(ProductCondition condition);
	ProductCondition getTotalItemsCount(ProductCondition condition);
}
