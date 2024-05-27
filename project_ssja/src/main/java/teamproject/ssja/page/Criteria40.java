package teamproject.ssja.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
//@AllArgsConstructor
@ToString
public class Criteria40 {
	private int pageNum; 
	private int amount; 
	
	
	public Criteria40() {
		this(1,40);
	}

	public Criteria40(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
		
	}	
}
