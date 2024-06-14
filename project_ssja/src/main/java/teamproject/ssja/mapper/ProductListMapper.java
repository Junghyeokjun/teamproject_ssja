package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import teamproject.ssja.dto.product.ProductCondition;
import teamproject.ssja.dto.product.ProductItemDto;
import teamproject.ssja.dto.userinfo.CartItemsDTO;

@Mapper
public interface ProductListMapper {

	List<ProductItemDto> getProductList(ProductCondition condition);
	
	int getTotalCountItems(ProductCondition condition);
	
	List<ProductItemDto> bestItemsList(int page);
	
	List<ProductItemDto> getCategoryItems(int categoryNum, int pageNum);
	
	List<CartItemsDTO> getYourItemCrat(long id);
	
	List<ProductDto> getProducts(String keyword);
	
	@Select("select count(*) from item_cart where m_no =#{id} and pro_no=#{productNum}")
	int checkUserAddCart(Long id, Long productNum);
	
	@Insert("INSERT INTO item_cart values (#{productNum}, #{id}, #{quantity}, sysdate)")
	void addCart(Long id, Long productNum,int quantity);
	
	@Update("update item_cart set i_quantity = ${quantity} where pro_no = #{productNum} and m_no=#{id}")
	void renewCart(Long id, Long productNum,int quantity);
}
