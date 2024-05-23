package teamproject.ssja.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EventInfoDTO {
	
	private int ev_no;
	private Date ev_startdate;
	private Date ev_duedate;
	private String ev_banner;
	private String ev_page;

}
