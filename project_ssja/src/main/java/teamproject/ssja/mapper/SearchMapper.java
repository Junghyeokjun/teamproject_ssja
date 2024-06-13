package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.product.ProductItemDto;
import teamproject.ssja.dto.product.SearchForm;

@Mapper
public interface SearchMapper {
	
	List<ProductItemDto> searchItemList(SearchForm form);
	int countSearchItemList(SearchForm form);
}
