package teamproject.ssja.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

@Mapper
public interface ChargePointMapper {

	
	@Insert("insert into points values (pt_seq.nextval, #{id}, 1, #{money}, '충전', sysdate)")
	void addChargeRecod(Long id, Long money);
	
	@Update("update members set m_point = m_point + #{money} where m_no=#{id}")
	void renewUserPoint(Long id, Long money);
}
