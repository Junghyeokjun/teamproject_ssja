package teamproject.ssja.service.signup;

import java.util.List;

import teamproject.ssja.dto.MembersDto;

public interface SignUpService {
	boolean idCheck(String id);
	boolean nickNameCheck(String nickName);
	boolean emailCheck(String email);
	String getEmail(String mid);
	boolean quantityCheck(long proNo,int quantity);
	boolean signUp(MembersDto member);
	void resetPw(String id, String pw);
	MembersDto getRelatedMember(long memberNum);
	void registSocialToUser(MembersDto member);
	List<String> getTerms();
	void updateTerms(String term1, String term2);
}
