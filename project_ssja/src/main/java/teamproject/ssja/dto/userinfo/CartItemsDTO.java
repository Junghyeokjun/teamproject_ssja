package teamproject.ssja.dto.userinfo;

import java.sql.Date;

import lombok.Data;

@Data
public class CartItemsDTO {

	
	private long pro_no;
	private int i_quantity;
	private Date i_date;
	private String pro_name;
	private long pro_price;
	private String pro_bannerimg;
}
