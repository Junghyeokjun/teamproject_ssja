package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.*;

import teamproject.ssja.dto.userinfo.AddressForm;
import teamproject.ssja.dto.userinfo.UserInfoDTO;
@Mapper
public interface MyPageMapper {
	
	UserInfoDTO getUserInfoInMyPage(long username);
	void changeAddress(AddressForm addressForm);
	void changePasswordProcess(Map<String,String> params);
	void deleteUserEnroll(String userId);
	
	@Delete("delete from members where m_deletedate < sysdate and not m_deletedate is null")
	void deleteEnrolled();
	
	@Select("select m_id from members where m_deletedate < sysdate and not m_deletedate is null")
	List<String> findDeleteEnrolledUsers();
	
	void deleteEnrolledUsersAuth(List<String> enrolledDeleteUsers);
}
