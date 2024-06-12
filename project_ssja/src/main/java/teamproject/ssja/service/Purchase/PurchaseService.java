package teamproject.ssja.service.Purchase;

import java.util.List;
import java.util.Map;

import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.userinfo.CouponDTO;

public interface PurchaseService {	

	//주문을 DB에 추가하는 메서드
	int Purchase(Map<String, Object> purchaseData);

	//개별 상품을 가져오는 메서드
	ProductDto getProduct(long proNo);
	
	//장바구니 목록을 이용해 상품의 리스트를 가져오는 메서드
	List<ProductDto> getProducts(List<Integer> itemList,long mno);

	//개별쿠폰을 가져오는 메서드
	List<CouponDTO> getUserCoupon(long mno);
}

