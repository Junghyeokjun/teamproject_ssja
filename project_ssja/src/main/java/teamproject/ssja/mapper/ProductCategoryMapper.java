package teamproject.ssja.mapper;

import java.util.List;

import teamproject.ssja.dto.ProductCategoryDto;
import teamproject.ssja.dto.ProductCategoryGroupDto;

public interface ProductCategoryMapper {
	// 전체 상품 카테고리 리스트 
	List<ProductCategoryDto> selectPCList();
	
	// 대분류
	List<ProductCategoryGroupDto> selectPCMainList();
	
	// 소분류
	List<ProductCategoryGroupDto> selectPCSubList(long mainPCNum);
	
	// 모든 카테고리 개수(소분류 카테고리 개수)
	long selectPCAllCount();
	
	// 대분류 카테고리 개수
	long selectPCMainCount();
	
	
	//
	// 관리자가 진행하는 부분
	//
	
	// 입력
	int insertPC(ProductCategoryDto pcDto);
	
	// 수정
	int updatePC(ProductCategoryDto pcDto);
	
	// 삭제
	int deletePC(ProductCategoryDto pcDto);

}

