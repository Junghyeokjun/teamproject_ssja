package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import teamproject.ssja.dto.logindto.SocialUserInfoDTO;

@Mapper
public interface SocialUserMapper {
	
	
    @Select("select * from SOCIALUSER where username = #{username}")
    SocialUserInfoDTO findByUserName(String username);

    @Insert("insert into SOCIALUSER values (m_seq.currval,#{username},#{email},#{auth},#{nickname},#{name})")
    void save(SocialUserInfoDTO socialUser);

    @Update("update SOCIALUSER set email = #{email}")
    void updateEmail(SocialUserInfoDTO socialUser);
    
    @Insert("insert into members (M_NO, M_ID, M_PW, M_NAME, M_ADDRESS1, M_ADDRESS2, M_ZIPCODE, M_BIRTH, M_EMAIL, M_PHONE, M_DATE, M_NICKNAME) "
    		+ "values (m_seq.nextval,#{email},#{randomPw},#{name},'nop','nop',0,to_date('2000-01-01', 'YYYY-MM-DD'),"
    		+ "#{email},'nop', sysdate, 'Social User' || nn_seq.nextval)")
    void enroll(SocialUserInfoDTO socialUser);
    
    @Insert("insert into authority(M_ID) VALUES (#{email})")
    void enrollAuth(SocialUserInfoDTO socialUser);

}