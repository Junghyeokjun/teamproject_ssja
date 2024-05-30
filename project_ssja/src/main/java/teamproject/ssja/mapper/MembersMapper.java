package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.PurchaseDto;

@Mapper
public interface MembersMapper {
	
	String getMid(String mid);
	String getMNickName(String mNickName);
	String getMEmail(String mEmail);
	String selectEmail(String mid);
	int getProQuantity(long proNo);
	int insertMember(MembersDto member);
	int insertUserAuth(String mid);
	int subPoint(long mNo,long point);
	void updatePw(String id, String pw);
}
