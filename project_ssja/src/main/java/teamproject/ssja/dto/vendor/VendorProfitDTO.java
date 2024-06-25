package teamproject.ssja.dto.vendor;

import lombok.Data;

@Data
public class VendorProfitDTO {
	private String order_date;
	private Long total_sales;
	private String pro_no;
	private String pro_name;
	private int quantity;
	

}
