package teamproject.ssja.dto.product;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class SearchForm {
	
	private String keyword;
	private Integer pageNum;
	private Integer start;
	private Integer end;
	private String selectedCondition;
	
	public SearchForm(String keyword, Integer pageNum, Integer start, Integer end,String selectedCondition) {
		this.keyword = keyword;
		
		if (pageNum == null) {	this.pageNum = 1; }
		else {	this.pageNum = pageNum;	}
		
		this.start = start;
		this.end = end;
		this.selectedCondition = selectedCondition;
	}

}
