package teamproject.ssja.service.Admin;

import java.util.List;

import teamproject.ssja.dto.CouponDto;
import teamproject.ssja.page.Criteria;

public interface CouponListService {
	
	long getCouponListTotalCount();
	List<CouponDto> getCouponListWithPaging(Criteria cri);
	int addCoupon(CouponDto couponDto);

}
