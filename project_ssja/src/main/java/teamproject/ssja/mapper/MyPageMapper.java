package teamproject.ssja.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.AddressForm;
import teamproject.ssja.dto.UserInfoDTO;
@Mapper
public interface MyPageMapper {
	
	UserInfoDTO getUserInfoInMyPage(long username);
	void changeAddress(AddressForm addressForm);
	void changePasswordProcess(Map<String,String> params);
}
