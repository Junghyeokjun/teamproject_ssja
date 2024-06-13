package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.dto.userinfo.CouponDTO;

@Mapper
public interface PurchaseMapper {
	//결제한 주문 삽입
	int insertPurchase(PurchaseDto dto);
	//유저의 쿠폰을 획득
	List<CouponDTO> selectOwnCoupons(long mno);
	//사용한 유저의 쿠폰을 삭제
	int deleteCoupon(long mno,long cno);
	//구매한 유저의 장바구니를 삭제
	int deleteItemCart(long mno,long prono);
}
