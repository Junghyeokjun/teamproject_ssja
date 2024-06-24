package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//P_DATE  NOT NULL DATE       
//P_PRICE NOT NULL NUMBER(20) 

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class VendorSalesDto {
	// 저장 데이터의 날짜들 보관
	private String orderDate;
	
	// 단위 별 통계 
	private long totalSales;
	
	// purchase에 포함된 order 개수  (계산 및 배달완료처리가 된 주문 개수)
	private long purchaseCount;
	
	// 변수에 값을 할당할 때, 구분지어서 할당하기 위함
	
	/* 데이터베이스에 넣을 때 사용될, 통계 조회 시 사용되는, 조회 구간을 나타내는 데이터*/	

	// 통계를 보기 위한 구간 데이터 1 (최소값)
	private String startDate; 
	
	// 통계를 보기 위한 구간 데이터 2 (최대값)
	private String endDate;
}
