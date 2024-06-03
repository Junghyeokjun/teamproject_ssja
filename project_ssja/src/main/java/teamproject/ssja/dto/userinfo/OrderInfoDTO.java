package teamproject.ssja.dto.userinfo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderInfoDTO {
	
	private long PUR_NO;
	private long PUR_TOT;
	private long PUR_PAY;
	private String PUR_PAYMENT;
	private String PUR_DATE;
	private String PUR_DVADDRESS;
	private String PUR_DV;
	private List<OrderItemInfoDTO> list;
}
