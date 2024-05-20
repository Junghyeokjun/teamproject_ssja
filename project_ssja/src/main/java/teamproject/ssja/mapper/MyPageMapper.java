package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.UserInfoDTO;
@Mapper
public interface MyPageMapper {
	
	UserInfoDTO getUserInfoInMyPage(String username);
	
}
