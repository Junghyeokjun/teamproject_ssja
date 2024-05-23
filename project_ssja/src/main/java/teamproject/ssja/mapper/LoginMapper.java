package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.userinfo.UserInfoDTO;
@Mapper
public interface LoginMapper {
	
	UserInfoDTO findByUsername(String username);
	
}
