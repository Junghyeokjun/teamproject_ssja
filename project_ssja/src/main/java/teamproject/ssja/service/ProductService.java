package teamproject.ssja.service;

import java.util.List;

import teamproject.ssja.dto.ProductDto;

public interface ProductService {
	
	List<ProductDto> getList();

	ProductDto get(long pRO_NO);
	
}

