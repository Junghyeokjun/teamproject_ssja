package teamproject.ssja.mapper;

import java.util.List;

import teamproject.ssja.dto.PointDTO;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.dto.userinfo.WishProductDTO;

public interface totalInfoMyPageMapper {
	
	
	List<PurchaseDto> getMyPurchaseList(long id, int pageNum);
	List<WishProductDTO> getMyWishProducts(long id, int pageNum);
	List<PointDTO> getMyPointInfo(long id, int pageNum);
	List<CouponDTO> getMyCouponInfo(long id, int pageNum, String orderFirst, String orderSecond);
	
	
	int getMyPurchaseCount(long id);
	int getMyPointCount(long id);
	int getMyWishCount(long id);
	int getMyCouponCount(long id);

}
