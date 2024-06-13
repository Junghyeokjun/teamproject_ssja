package teamproject.ssja.dto.userinfo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class CouponDTO {
	
	private int c_no;
	private Date c_duedate;
	private String c_name;
	private int c_dcper;
}
