package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.UserInfoDTO;
@Mapper
public interface LoginMapper {
	
	UserInfoDTO findByUsername(String username);
	
}
