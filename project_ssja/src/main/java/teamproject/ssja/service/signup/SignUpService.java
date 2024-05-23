package teamproject.ssja.service.signup;

import teamproject.ssja.dto.MembersDto;

public interface SignUpService {
	boolean idCheck(String id);
	boolean nickNameCheck(String nickName);
	boolean signUp(MembersDto member);
}
