package teamproject.ssja.service.Product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.dto.product.ProductItemDto;
import teamproject.ssja.mapper.ProductListMapper;
@RequiredArgsConstructor
public class ProductServiceImpl implements ProductService{

	
	private final ProductListMapper productMapper;

	@Override
	public List<ProductItemDto> getProductList(ProductCondition conditionItems) {
		return productMapper.getProductList(conditionItems);
	}

	@Override
	public ProductCondition getTotalItemsCount(ProductCondition condition) {
		int total = productMapper.getTotalCountItems(condition);
		ProductCondition conditionItems= new ProductCondition(condition, total);
		return conditionItems;
	}

	@Override
	public List<ProductItemDto> bestItemsList() {
		
		return productMapper.bestItemsList();
	}
	
	
}
