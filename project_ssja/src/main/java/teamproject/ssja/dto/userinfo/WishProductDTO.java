package teamproject.ssja.dto.userinfo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class WishProductDTO {
	
	private long pro_no;
	private Date wish_date;
	private String pro_bannerimg;
	private String pro_name;
	private int pro_price;
	private String pro_bizname;

}
