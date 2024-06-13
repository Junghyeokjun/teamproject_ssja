package teamproject.ssja.dto.product;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class SearchResultsWithConditionDTO {
	private String keyword;
	private Integer pageNum;
	private Integer start;
	private Integer end;
	private String selectedCondition;
	private List<ProductItemDto> itemList;
	private boolean prev;
	private boolean next;
	private int startPage;
	private int endPage;
	private long total;

	public SearchResultsWithConditionDTO(SearchForm form,long total) {
		this.keyword = form.getKeyword();
		this.total = total;
		if (pageNum == null) {
			this.pageNum = 1;
		} else {
			this.pageNum = form.getPageNum();
		}
		this.start = form.getStart();
		this.end = form.getEnd();
		this.selectedCondition = form.getSelectedCondition();
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
