package teamproject.ssja.service.Purchase;

import java.util.Map;

import teamproject.ssja.dto.ProductDto;

public interface PurchaseService {	

	//주문을 DB에 추가하는 메서드
	int Purchase(Map<String, Object> purchaseData);

	//개별 상품을 가져오는 메서드
	ProductDto getProduct(long proNo);
}

