package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrdersSearchDto {
	private long O_NO;
	private long M_NO;
	private String PRO_NAME;
	private long O_QUANTITY;	
	private long PUR_TOT;
	private String PUR_DATE;
	private String PUR_DVADDRESS;
	private String PUR_DV;
		
	// 검색필터
		private String type;// 검색 타입
		private String keyword;// 검색 내용
}
