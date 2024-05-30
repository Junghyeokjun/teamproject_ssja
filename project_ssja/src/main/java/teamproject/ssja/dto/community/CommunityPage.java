package teamproject.ssja.dto.community;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import teamproject.ssja.page.Criteria40;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class CommunityPage {
	private int startPage;
	private int endPage;
	private long total;
	private boolean prev;
	private boolean next;
	
	private int pageNum;
	private int amount;

	public CommunityPage(int pageNum, long total) {
		
		this.amount = 20;
		this.total = total;
		this.pageNum=pageNum;
		this.endPage = (int) Math.ceil(pageNum / 10.0) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / 40));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
