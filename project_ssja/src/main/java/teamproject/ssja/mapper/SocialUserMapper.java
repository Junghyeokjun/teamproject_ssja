package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.login.SocialUserInfoDTO;

@Mapper
public interface SocialUserMapper {
	//일단 xml안하고 그즉석으로 만들어 뒀습니다. Mapper.xml로는 없습니다.
	
    @Select("select * from SOCIALUSER where username = #{username}")
    SocialUserInfoDTO findByUserName(String username);

    @Insert("insert into SOCIALUSER values (m_seq.currval,#{username},#{email},#{auth},#{nickname},#{name})")
    void save(SocialUserInfoDTO socialUser);

    @Update("update SOCIALUSER set email = #{email} where username=#{username} ")
    void updateEmail(SocialUserInfoDTO socialUser);
    
    @Insert("insert into members (M_NO, M_ID, M_PW, M_NAME, M_ADDRESS1, M_ADDRESS2, M_ZIPCODE, M_BIRTH, M_EMAIL, M_PHONE, M_DATE, M_NICKNAME) "
    		+ "values (m_seq.nextval,#{email},#{randomPw},#{name},'nop','nop',0,to_date('2000-01-01', 'YYYY-MM-DD'),"
    		+ "#{email},'nop', sysdate, 'Social User' || nn_seq.nextval)")
    void enroll(SocialUserInfoDTO socialUser);
    
    @Insert("insert into authority(M_ID) VALUES (#{email})")
    void enrollAuth(SocialUserInfoDTO socialUser);

    @Select("select m_no from members where m_email = #{email}")
    Long checkDuplicateEmail(String email);
    
    @Insert("insert into socialuser values (#{id},#{username},#{email},#{auth},#{nickname},#{name})")
    void addSocialExistingUser(SocialUserInfoDTO socialUser); 
    
    @Select("select m_id, m_email,m_name from members where m_no = #{memberNum}")
    MembersDto getRelatedMember(long memberNum);
    

	@Update("UPDATE members SET M_PW = #{M_PW}, M_NICKNAME=#{M_NICKNAME}, "
			+ "M_ADDRESS1=#{M_ADDRESS1}, M_ADDRESS2=#{M_ADDRESS2}, M_ZIPCODE = #{M_ZIPCODE},M_BIRTH=#{M_BIRTH},"
			+ " M_DATE = sysdate, M_PHONE = #{M_PHONE} WHERE M_NO = #{M_NO} ")
	void renewUser(MembersDto member);


	@Update("UPDATE SOCIALUSER SET AUTH='ROLE_USER' WHERE ID = #{memberNum}")
	void renewAuthSocial(long memberNum);

	
    
    
}