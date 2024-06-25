package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//P_DATE  NOT NULL DATE       
//P_PRICE NOT NULL NUMBER(20) 

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class VendorSalesDto {
	// 저장 데이터의 날짜들 보관
	private String orderDate;
	
	// 단위 별 통계 
	private long totalSales;

	// purchase에 포함된 order 개수  (계산 및 배달완료처리가 된 주문 개수)
	private long purchaseCount;
	
	// 지난 주, 저번 달, 저번 년도(단위별 이전 데이터)
	private long lastTotalSales;
	
	private long lastPurchaseCount;
	
	// 변수에 값을 할당할 때, 구분지어서 할당하기 위함
	
	// 판매된 상품들의 개수
	private long productSoldCount;
}
