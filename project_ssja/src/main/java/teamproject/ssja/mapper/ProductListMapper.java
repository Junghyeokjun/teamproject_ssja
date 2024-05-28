package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;

@Mapper
public interface ProductListMapper {

	List<ProductDto> getProductList(ProductCondition condition);
	
	@Select("select count(*) from product where p_c_no=#{category}")
	int getTotalCountItems(int category);
}
