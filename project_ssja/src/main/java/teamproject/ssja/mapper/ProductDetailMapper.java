package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;
import teamproject.ssja.dto.ProductDetailDto;

@Mapper
public interface ProductDetailMapper {
	
	ProductDetailDto read(long PRO_NO);
	
}

