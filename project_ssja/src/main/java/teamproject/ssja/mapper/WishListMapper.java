package teamproject.ssja.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import teamproject.ssja.dto.WishListDTO;

@Mapper
public interface WishListMapper {

	
	
	@Select("SELECT COUNT(wishlist.pro_no) AS countwish, product.pro_wish as pro_wish\r\n" + 
			"FROM product\r\n" + 
			"LEFT JOIN wishlist ON product.pro_no = wishlist.pro_no AND wishlist.m_no = #{memberNum}\r\n" + 
			"WHERE product.pro_no = #{productNum}\r\n" + 
			"GROUP BY product.pro_wish")
	WishListDTO checkSelected(Map<String, Long> params);
	
	@Delete("delete from wishlist where  m_no = #{memberNum} and pro_no = #{productNum}")
	void removeWishList(Map<String, Long> params);
	
	@Insert("insert into wishlist (m_no,pro_no) values (#{memberNum}, #{productNum})")
	void addWishList(Map<String, Long> params);
	
	@Update("update product set pro_wish = pro_wish - 1 where pro_no = #{productNum}")
	void minusWishProduct(Long productNum);
	
	@Update("update product set pro_wish = pro_wish + 1 where pro_no = #{productNum}")
	void plusWishProduct(Long productNum);
	

	
}
