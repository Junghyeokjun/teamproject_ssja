package teamproject.ssja.service.Product;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.dto.product.ProductItemDto;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.mapper.ProductListMapper;

@Service
public class ProductServiceImpl implements ProductService{

	@Autowired
	 ProductListMapper productMapper;

	@Override
	public List<ProductItemDto> getProductList(ProductCondition conditionItems) {
		return productMapper.getProductList(conditionItems);
	}

	@Override
	public ProductCondition getTotalItemsCount(ProductCondition condition) {
		int total = productMapper.getTotalCountItems(condition);
		ProductCondition conditionItems= new ProductCondition(condition, total);
		return conditionItems;
	}

	@Override
	public List<ProductItemDto> bestItemsList(int page) {
		// TODO Auto-generated method stub
		return productMapper.bestItemsList(page);
	}


	public List<CartItemsDTO >getYourItemCrat(){
		long id = InfoProvider.getM_NO();
		return productMapper.getYourItemCrat(id);
		
	}

	@Override
	public List<ProductItemDto> getCategoryItems(int categoryNum, int pageNum) {
		
		return productMapper.getCategoryItems(categoryNum, pageNum);
	}
}
