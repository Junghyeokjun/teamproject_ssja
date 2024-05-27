package teamproject.ssja.page;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class Criteria {
	// 페이징 처리를 위해서는 페이지 번호, 한 페이지당 몇 개의 데이터를 보여줄 것인지 결정되어야 함.
	private int pageNum; // 페이지 번호
	private int amount; // 한 페이지당 보여줄 데이터 개수
	private long bno;
	private long PRO_NO;
	
	
	public Criteria() {
		this(1,10); // 기본값 1페이지 10개로 지정
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}	
}
