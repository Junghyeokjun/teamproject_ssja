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
public class SalesDto {
	private String orderInfo;
	private int daySales;//일일매출
	private int monthSales;//월매출
	private int yearSales;//년매출
}
