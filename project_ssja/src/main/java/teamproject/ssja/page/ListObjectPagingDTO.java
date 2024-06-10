package teamproject.ssja.page;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import teamproject.ssja.dto.userinfo.CartItemsDTO;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ListObjectPagingDTO {
	//페이징 10개씩 10단위로 하는 경우에 객체를 list로 받을 때 사용하시면 쓸만할 겁니다.
	//해당 객체를 사용하시고 setObjectList를 좀 안전(?)하게 오버로딩하셔서 사용하시길 바랍니다.

	private long total;
	private List<?> objectList;//와일드 카드로 다른 객체의 리스트로 넣어사용이 가능은 합니다.
	//혹시 모르니 밑에 Setter메서드 본인 사용하시는 타입으로 오버로딩 혹시 모르니까 하시기를
	private int pageNum;
	private boolean prev;
	private boolean next;
	private int startPage; 
	private int endPage;
	
	public ListObjectPagingDTO(long total,int pageNum) {
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

	public void setObjectList(List<CartItemsDTO> list) {
	
		this.objectList = list;
		
	}
}
