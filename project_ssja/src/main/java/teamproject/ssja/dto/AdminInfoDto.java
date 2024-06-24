package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AdminInfoDto {
	private int Daily_mcount; //오늘 가입자 수
	private int Daily_purcount;//오늘 주문 건수
	private int Daily_pricecount;//오늘 총 매출액
}
