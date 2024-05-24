package teamproject.ssja.service.Product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.mapper.ProductListMapper;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductListMapper productMapper;

	@Override
	public List<ProductDto> getProductList() {
		return productMapper.getProductList();
	}
	
	
}
