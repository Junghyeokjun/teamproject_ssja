package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import teamproject.ssja.dto.ProductDto;

@Mapper
public interface ProductListMapper {

	@Select("select * from (select * ,rownum as rnum from product) a  where a.rnum <=20")
	List<ProductDto> getProductList();
}
