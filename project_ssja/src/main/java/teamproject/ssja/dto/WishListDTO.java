package teamproject.ssja.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class WishListDTO {

	private long pro_no;
	private long m_no;
	private Date wish_date;
	private int pro_wish;
	private int countWish;
}
