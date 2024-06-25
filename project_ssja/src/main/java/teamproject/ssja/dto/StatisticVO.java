package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class StatisticVO {
	
	// 특정 통계 데이터를 메서드로 전달할 때 사용하는 클래스

	// 먼저 판매자 통계를 보여주는데 사용하기 위함. 판매자 번호가 필요함. 	
	private long vno;
	// 특정 연도(ex) 2024)/ 특정 월(ex) 2024-06)등의 조건이 들어가는 문자열. 
	// 쿼리문에서는 TO_CHAR(P.PUR_DATE, 'YYYY-MM') = '' 이런 식으로 문자열 비교를 하기 때문에 문자열이 들어가도 됨.
	// 대신 문자열 형태는 '2024-06' 혹은 '2024' 이런 식으로 받아야 함.
	private String dateStr;
}
