package teamproject.ssja.dto;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PointDTO {
	
	private String pt_no;
	private Date pt_date;
	private int pt_change;
	private int pt_amount;
	private String pt_reason;


}
