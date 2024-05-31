package teamproject.ssja.service.signup;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.mapper.MembersMapper;
import teamproject.ssja.mapper.SocialUserMapper;
@Slf4j
@Service
public class SignUpServiceImpl implements SignUpService {

	@Autowired
	MembersMapper membersMapper;
	@Autowired
	PasswordEncoder passwordEncoder;
	@Autowired
	SocialUserMapper socialMapper;
	
	@Override
	public boolean idCheck(String id) {
		//반환값이 null일시 테이블에 존재하지 않는다는것이므로 사용가능(true)
		return membersMapper.getMid(id)==null;
	}

	@Override
	public boolean nickNameCheck(String nickName) {
		//반환값이 null일시 테이블에 존재하지 않는다는것이므로 사용가능(true)
		return membersMapper.getMNickName(nickName)==null;
	}

	@Override
	public boolean emailCheck(String email) {
		//반환값이 null일시 테이블에 존재하지 않는다는것이므로 사용가능(true)
		return membersMapper.getMEmail(email)==null;
	}

	@Override
	public boolean quantityCheck(long proNo, int quantity) {
		//반환값이 구매수량(quantity)보다 크면 구매가 가능하다는것이므로 true
		return (membersMapper.getProQuantity(proNo)>=quantity);
	}

	@Override
	public String getEmail(String mid) {
		return membersMapper.selectEmail(mid);
	}
	
	@Override
	public boolean signUp(MembersDto member) {
		//가입에 성공했을시 권한테이블에 추가후 true반환
		System.out.println(member.getM_PW()); //나중에 처리
		member.setM_PW(passwordEncoder.encode(member.getM_PW()));
		int result=membersMapper.insertMember(member);
		if(result==1) {
			membersMapper.insertUserAuth(member.getM_ID());
			return true;
		}else {
			return false;
		}
	}

	@Override
	public void resetPw(String id, String pw) {
		membersMapper.updatePw(id,passwordEncoder.encode(pw));
	}

	@Override
	public MembersDto getRelatedMember(long memberNum) {
	
		return socialMapper.getRelatedMember(memberNum);
	}

	@Override
	public void registSocialToUser(MembersDto member) {
		
		log.info("비밀번호 : {}",member.getM_PW() );
		
		member.setM_PW(passwordEncoder.encode(member.getM_PW()));
		log.info("암호화된 비밀번호 : {}",member.getM_PW() );
		socialMapper.renewUser(member);
		socialMapper.renewAuthSocial(member.getM_NO());
		
	}



	
	
}
