package teamproject.ssja.service.signup;

import teamproject.ssja.dto.MembersDto;

public interface SignUpService {
	boolean idCheck(String id);
	boolean nickNameCheck(String nickName);
	boolean emailCheck(String email);
	String getEmail(String mid);
	boolean quantityCheck(long proNo,int quantity);
	boolean signUp(MembersDto member);
}
