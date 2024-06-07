package teamproject.ssja.dto.userinfo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemInfoDTO {
	private long O_NO;
	private long PRO_NO;
	private long O_QUANTITY;
	private long O_DISCOUNT;
	private long O_PRICE;
	private long O_PAY;
	private long O_USECOUPON;
	private String O_STATE;
	private int isWiriteReview;
	private String PRO_NAME;
	private String PRO_BIZNAME;
	private String PRO_BANNERIMG;
	private int totalCount;

	
}
