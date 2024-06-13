package teamproject.ssja.page;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import teamproject.ssja.dto.userinfo.CartItemsDTO;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListObjectPaging5DTO {
	//페이징 10개씩 10단위로 하는 경우에 객체를 list로 받을 때 사용하시면 쓸만할 겁니다.

	private long total;
	private List<?> objectList;//와일드 카드로 다른 객체의 리스트로 넣어사용이 가능은 합니다.
	
	private int pageNum;
	private boolean prev;
	private boolean next;
	private int startPage; 
	private int endPage;
	
	public ListObjectPaging5DTO(long total,int pageNum) {
		this.pageNum = pageNum;
		this.total = total;
		
		this.endPage = (int) Math.ceil(pageNum / 5.0) * 5;
		this.startPage = this.endPage - 4;

		int realEnd = (int) (Math.ceil((total * 1.0) / 5));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;

		this.next = this.endPage < realEnd;
	}

	public void setObjectList(List<?> list) {
	
		this.objectList = list;
		
	}
}
