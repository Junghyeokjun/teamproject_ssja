package teamproject.ssja.service.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.mapper.TestMapper;

@Service
public class SignUpServiceImpl implements SignUpService {

	@Autowired
	TestMapper testMapper;
	
	@Override
	public boolean idCheck(String id) {
		//반환값이 null일시 테이블에 존재하지 않는다는것이므로 사용가능(true)
		return testMapper.getMid(id)==null;
	}

	@Override
	public boolean nameCheck(String name) {
		//반환값이 null일시 테이블에 존재하지 않는다는것이므로 사용가능(true)
		return testMapper.getMName(name)==null;
	}

	@Override
	public boolean signUp(MembersDto member) {
		//가입에 성공했을시 권한테이블에 추가후 true반환
		int result=testMapper.insertMember(member);
		if(result==1) {
			testMapper.insertUserAuth(member.getM_ID());
			return true;
		}else {
			return false;
		}
	}
	
	
}
