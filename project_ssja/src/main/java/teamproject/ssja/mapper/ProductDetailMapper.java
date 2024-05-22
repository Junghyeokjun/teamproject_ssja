package teamproject.ssja.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.ProductDto;

@Mapper
public interface ProductMapper {
	
	List<ProductDto> read(long PRO_NO);

	
}

