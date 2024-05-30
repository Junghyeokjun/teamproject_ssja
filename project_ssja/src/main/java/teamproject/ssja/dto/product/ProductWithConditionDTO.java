package teamproject.ssja.dto.product;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.page.Criteria40;

@Getter
@AllArgsConstructor
public class ProductWithConditionDTO {
	
	private int startPage;
	private int endPage;
	private long total;
	private boolean prev;
	private boolean next;

	private String conditionSelect;
	private String conditionName;
	private int conditionStart;
	private int conditionEnd;
	private int category;
	private int pageNum;
	private int amount;
	 
	private List<ProductItemDto> itemList;
	

	public ProductWithConditionDTO(ProductCondition condition) {
		this.category=condition.getCategory();
		this.conditionStart=condition.getConditionStart();
		this.conditionEnd=condition.getConditionEnd();
		this.conditionName=condition.getConditionName();
		this.conditionSelect=condition.getConditionSelect();
		this.pageNum = condition.getPageNum();
		this.amount=condition.getAmount();
		this.startPage=condition.getStartPage();
		this.endPage=condition.getEndPage();
		this.total=condition.getTotal();
		this.prev=condition.isPrev();
		this.next=condition.isNext();
	}
	
	public ProductWithConditionDTO() {
		
	}

	
	public void setItemList(List<ProductItemDto> itemList) {
		
	this.itemList = itemList;
	}
}
