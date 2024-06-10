package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.*;

import teamproject.ssja.dto.product.ProductNumberDTO;
import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.CartItemsDTO;
import teamproject.ssja.dto.userinfo.OrderInfoDTO;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
import teamproject.ssja.dto.vendor.VendorInfoDTO;
@Mapper
public interface MyPageMapper {
	
	UserInfoDTO getUserInfoInMyPage(long username);
	void changeAddress(AddressForm addressForm);
	void changePasswordProcess(Map<String,String> params);
	void deleteUserEnroll(long userId);
	
	@Delete("update members set where m_deletedate < sysdate and not m_deletedate is null")
	void deleteEnrolled();
	
	@Select("select m_id from members where m_deletedate < sysdate and not m_deletedate is null")
	List<String> findDeleteEnrolledUsers();
	
	void deleteEnrolledUsersAuth(List<String> enrolledDeleteUsers);
	
	void modifyUserEmail(Map<String,String> params);
	
	List<OrderInfoDTO> getPurchaseData(Map<String,Long> params);
	
	long getProductCount(long id);
	
	@Select("SELECT m_email FROM members WHERE m_no = #{id} ")
	String checkEmail( long id);
	
	@Select("SELECT count(V_BIZNAME) FROM vendor WHERE v_BIZNAME=#{bizName}")
	int checkDuplicatedBizname(String bizName);
	
	void enrollVendor(VendorInfoDTO vendorInfo);
	
	@Select("select v_no, v_bizname, v_account, v_license, v_fax from vendor where m_no = #{id}")
	VendorInfoDTO getVendoInfo(long id);
	
	@Update("update authority set auth='ROLE_VENDOR where M_ID = #{username}")
	void renewRoleToVnedor(String username);
	
	@Select("SELECT count(v_no) from VENDOR where M_NO = #{id}")
	int isAppliedVendor(long id);
	
	
	@Select("SELECT count(m_no) from item_cart where m_no = #{id}")
	int getTotalCartItems(long id);
	
	
	List<CartItemsDTO> getMyCartItems(Map<String, Long> params);
	
	void deleteCartItem(ProductNumberDTO data);
}
