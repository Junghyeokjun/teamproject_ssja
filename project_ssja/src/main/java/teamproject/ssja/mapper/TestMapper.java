package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.MembersDto;

@Mapper
public interface TestMapper {
	
	String getMid(String mid);
	String getMNickName(String mNickName);
	int insertMember(MembersDto member);
	int insertUserAuth(String mid);
}
