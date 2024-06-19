package teamproject.ssja.dto.vendor;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@NoArgsConstructor
public class VendorItemCondition {

	private String bizname;
	private int pageNum;
	private int start;
	private int end;
	private String order;
	
	public VendorItemCondition(String bizname, int pageNum, int start, int end, String order) {
		this.bizname = bizname;
		this.pageNum = pageNum;
		this.start = start;
		this.end = end;
		this.order = order;
	}
}
