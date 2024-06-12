package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.userinfo.CouponDTO;

@Mapper
public interface PurchaseMapper {
	
	int insertPurchase(PurchaseDto dto);
	
	List<CouponDTO> selectOwnCoupons(long mno);
}
