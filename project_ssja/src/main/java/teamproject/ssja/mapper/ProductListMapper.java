package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.dto.product.ProductItemDto;

@Mapper
public interface ProductListMapper {

	List<ProductItemDto> getProductList(ProductCondition condition);
	
	int getTotalCountItems(ProductCondition condition);
	
	List<ProductItemDto> bestItemsList();
}
