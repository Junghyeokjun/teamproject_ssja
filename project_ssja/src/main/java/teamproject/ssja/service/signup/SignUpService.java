package teamproject.ssja.service.signup;

import teamproject.ssja.dto.MembersDto;

public interface SignUpService {
	boolean idCheck(String id);
	boolean nameCheck(String name);
	boolean signUp(MembersDto member);
}
