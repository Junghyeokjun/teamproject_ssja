package teamproject.ssja.service.Admin;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.userinfo.CouponDTO;
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
	public List<CouponDTO> getCouponListWithPaging(Criteria cri) {
		log.info("getCouponListWithPaging()..");
		return adminPageMapper.getCouponListWithPaging(cri);
	}

	@Override
	public int addCoupon(CouponDTO couponDto) {
		log.info("addCoupon()..");
		return adminPageMapper.insertCoupon(couponDto);
		
	}

//	@Override
//	public int modifyCoupon(CouponDTO couponDto) {
//		log.info("modifyCoupon()..");
//		return adminPageMapper.updateCoupon(couponDto);
//		
//	}
    @Override
	public CouponDTO getCouponById(int couponId) {
        return adminPageMapper.read(couponId); // read 쿼리 실행
    }

    @Override
    public void modifyCoupon(CouponDTO couponDto) {
    	adminPageMapper.updateCoupon(couponDto); // updateCoupon 쿼리 실행
    }
    
    @Override
	public int removeCoupon(CouponDTO couponDto) {
		log.info("removeCoupon()..");
		return adminPageMapper.deleteCoupon(couponDto);
	}
	

}
