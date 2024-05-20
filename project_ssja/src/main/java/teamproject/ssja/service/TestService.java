package teamproject.ssja.service;

import teamproject.ssja.dto.MembersDto;

public interface TestService {
	boolean idCheck(String id);
	boolean nameCheck(String name);
	boolean signUp(MembersDto member);
}
