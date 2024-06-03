package teamproject.ssja.dto.userinfo;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPageOrdersDTO {

	
	private long total;
	private List<OrderInfoDTO> orderList;
	private int pageNum;
	private boolean prev;
	private boolean next;
	private int startPage; 
	private int endPage;
	
	public MyPageOrdersDTO(long total,int pageNum) {
		this.pageNum = pageNum;
		this.total = total;
		
		this.endPage = (int) Math.ceil(pageNum / 10.0) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / 10));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;
	}
}
