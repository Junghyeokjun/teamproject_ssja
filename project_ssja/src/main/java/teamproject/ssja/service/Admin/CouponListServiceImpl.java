package teamproject.ssja.service.Admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.CouponDto;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class CouponListServiceImpl implements CouponListService {

	@Autowired
	private AdminPageMapper adminPageMapper;

	@Override
	public long getCouponListTotalCount() {
		log.info("getCouponListTotalCount()..");	
		return adminPageMapper.getCouponListTotalCount();
	}

	@Override
	public List<CouponDto> getCouponListWithPaging(Criteria cri) {
		log.info("getCouponListWithPaging()..");
		return adminPageMapper.getCouponListWithPaging(cri);
	}

	@Override
	public int addCoupon(CouponDto couponDto) {
		log.info("addCoupon()..");
		return adminPageMapper.insertCoupon(couponDto);
		
	}
	

}
