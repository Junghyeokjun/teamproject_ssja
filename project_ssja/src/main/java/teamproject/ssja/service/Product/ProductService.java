package teamproject.ssja.service.Product;

import java.util.List;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.dto.product.ProductItemDto;
import teamproject.ssja.dto.product.SearchForm;
import teamproject.ssja.dto.product.SearchResultsWithConditionDTO;
import teamproject.ssja.dto.userinfo.CartItemsDTO;

public interface ProductService {

	List<ProductItemDto> getProductList(ProductCondition condition);
	ProductCondition getTotalItemsCount(ProductCondition condition);
	List<ProductItemDto> bestItemsList(int page);
	List<ProductItemDto> getCategoryItems(int categoryNum, int pageNum);
	
	List<CartItemsDTO >getYourItemCrat();
	
	SearchResultsWithConditionDTO getSearchItems(SearchForm form);
}
