package teamproject.ssja.dto.mainpage;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EventPageDTO {
	
	private int ev_no;
	private String ev_startdate;
	private String ev_duedate;
	private int ev_status; 
}
