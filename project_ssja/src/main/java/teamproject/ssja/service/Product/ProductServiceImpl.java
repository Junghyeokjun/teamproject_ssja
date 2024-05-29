package teamproject.ssja.service.Product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.dto.product.ProductItemDto;
import teamproject.ssja.mapper.ProductListMapper;
@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductListMapper productMapper;

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
	
	
}