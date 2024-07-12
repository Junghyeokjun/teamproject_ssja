package teamproject.ssja.mapper;

import static org.assertj.core.api.Assertions.assertThat;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.junit.jupiter.api.Assertions.assertThrows;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.transaction.annotation.Transactional;

import java.sql.SQLIntegrityConstraintViolationException;
import java.util.*;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProfitDto;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;

@Transactional
@Slf4j
@SpringBootTest
public class AdminPageMapperTest {

	
	@Autowired
	AdminPageMapper adminPageMapper;
	
	@Test 
	void memberCountTest() {
		long resultCount = adminPageMapper.getMemberListTotalCount();
		assertThat(resultCount > 0).isTrue();
		assertNotNull(resultCount);
	}
	
	@Test
	void testPagingMember() {
		Criteria cri = new Criteria();
		List<MembersDto> members = adminPageMapper.getMemberListWithPaging(cri);
				
		assertNotNull(members);
		assertThat(members.size()).isEqualTo(10);
		assertThat(members.isEmpty()).isFalse();
		
		List<ProductDto> pros = adminPageMapper.getProductListWithPaging(cri);
		assertNotNull(pros);
		assertThat(pros.size()).isEqualTo(10);
		assertThat(pros.isEmpty()).isFalse();

				
		List<CouponDTO> coupons = adminPageMapper.getCouponListWithPaging( cri);
		assertNotNull(coupons);
		assertThat(coupons.isEmpty()).isFalse();

		
		List<PurchaseDto> purs = adminPageMapper.getPerchaseListWithPaging( cri);
		assertNotNull(purs);
		assertThat(purs.size()).isEqualTo(10);
		assertThat(purs.isEmpty()).isFalse();

	}
	
	
	@Test
	void testProfitStatistic() {
		List<ProfitDto> dayCurr = adminPageMapper.totalDailyProfitData();
		assertNotNull(dayCurr);
		assertThat(dayCurr.size()).isNotEqualTo(0);
		
		assertThrows(DuplicateKeyException.class, () -> 
		adminPageMapper.renewYesterdayProfit()
				);
		
	
	}
	
	@Test
	void testReadMember() {
		int existMemberId = 1;
		int nonExistMemberId = 24567;
		MembersDto existMember=adminPageMapper.readMemberId(existMemberId);
		MembersDto nonExistMember=adminPageMapper.readMemberId(nonExistMemberId);
		assertThat(existMember.getM_ID()).isNotNull();
		assertThrows(NullPointerException.class, () ->nonExistMember.getM_ID());
	}
	
}
