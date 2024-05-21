package teamproject.ssja.service;

import java.util.List;

import teamproject.ssja.dto.ProductDto;

public interface ProductService {
	
//	List<ProductDto> getList();

	List<ProductDto> get(long PRO_NO);
	
}

