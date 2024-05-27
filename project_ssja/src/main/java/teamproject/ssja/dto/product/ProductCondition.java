package teamproject.ssja.dto.product;

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
public class ProductCondition {
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

	public ProductCondition(ProductCondition condition, long total) {
		this.pageNum = condition.getPageNum();
		this.conditionName = condition.getConditionName();
		this.conditionSelect = condition.getConditionSelect();
		this.category = condition.getCategory();
		this.conditionStart = condition.getConditionStart();
		this.conditionEnd = condition.getConditionEnd();

		this.amount = 40;
		this.total = total;
		this.endPage = (int) Math.ceil(condition.getPageNum() / 10.0) * 10;
		this.startPage = this.endPage - 9;

		int realEnd = (int) (Math.ceil((total * 1.0) / 40));

		if (realEnd <= this.endPage) {
			this.endPage = realEnd;
		}

		this.prev = this.startPage > 1;
		this.next = this.endPage < realEnd;
	}
}
