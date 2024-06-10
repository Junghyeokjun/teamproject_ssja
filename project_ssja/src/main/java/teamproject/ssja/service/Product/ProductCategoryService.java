package teamproject.ssja.service.Product;

import java.util.List;

import teamproject.ssja.dto.ProductCategoryDto;
import teamproject.ssja.dto.ProductCategoryGroupDto;

public interface ProductCategoryService {

	// 분류 구분없는 전체 이름
	List<ProductCategoryDto> getPCFullName();

	// 대분류
	List<ProductCategoryGroupDto> getPCMain();

	// 소분류
	List<ProductCategoryGroupDto> getPCSub();
	
	// 대분류 개수
	long getMainPCTotal();
	
	// 모든 카테고리 개수
	long getPCTotal();
}
