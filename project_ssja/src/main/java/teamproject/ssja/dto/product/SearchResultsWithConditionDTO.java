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
	
	public SearchResultsWithConditionDTO(SearchForm form) {
this.keyword = form.getKeyword();
		
		if (pageNum == null) {	this.pageNum = 1; }
		else {	this.pageNum = form.getPageNum();	}
		
		this.start = form.getStart();
		this.end = form.getEnd();
		this.selectedCondition = form.getSelectedCondition();
	}
	
}
