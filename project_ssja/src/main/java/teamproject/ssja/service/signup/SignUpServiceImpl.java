package teamproject.ssja.service.signup;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	
	@Transactional
	@Override
	public boolean signUp(MembersDto member) {
		//가입에 성공했을시 권한테이블에 추가후 true반환
		System.out.println(member.getM_PW()); //나중에 처리
		member.setM_PW(passwordEncoder.encode(member.getM_PW()));
		int result=membersMapper.insertMember(member);
		System.out.println(member);
		if(result==1) {
			membersMapper.insertSignUpCoupon(member.getM_NO());
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

	@Override
	public List<String> getTerms() {
		List<String> termsList= new ArrayList<String>();
		//추후에 파일위치에 따라 경로 수정
		//현재는 상대경로로 프로젝트 디렉터리를 루트로 하여 참조
		File file=new File("src/main/resources/static/terms.dat");
		File file2=new File("src/main/resources/static/terms2.dat");

		FileInputStream stream=null;
		FileInputStream stream2=null;
		try {
			stream = new FileInputStream(file);
			stream2 = new FileInputStream(file2);

			int bufSize= stream.available();
			byte[] buf = new byte[bufSize];
			stream.read(buf);
			
			termsList.add(new String(buf));
			
			bufSize= stream2.available();
			buf = new byte[bufSize];
			stream2.read(buf);
			
			termsList.add(new String(buf));
			
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				stream.close();
				stream2.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	

		return termsList;
	}
	@Override
	public void updateTerms(String term1, String term2) {
		List<String> termsList= new ArrayList<String>();
		//추후에 파일위치에 따라 경로 수정
		File file=new File("src/main/resources/static/terms.dat");
		File file2=new File("src/main/resources/static/terms2.dat");

		FileOutputStream stream=null;
		FileOutputStream stream2=null;
		try {
			stream = new FileOutputStream(file);
			stream2 = new FileOutputStream(file2);
			
			byte[] buf= term1.getBytes();
			stream.write(buf);
			
			buf=term2.getBytes();
			stream2.write(buf);		
			
		}catch (Exception e) {
			System.out.println(e);
		} finally {
			try {
				stream.close();
				stream2.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	

		return ;
	}
	


	
	
}
