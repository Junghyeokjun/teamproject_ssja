package teamproject.ssja.service.Admin;

import java.util.List;

import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;

public interface CouponListService {
	
	long getCouponListTotalCount();
	List<CouponDTO> getCouponListWithPaging(Criteria cri);
	int addCoupon(CouponDTO couponDto);
	
	CouponDTO getCouponById(int c_no);
	void modifyCoupon(CouponDTO couponDto);
	
	int removeCoupon(CouponDTO couponDto);
	
}
