package teamproject.ssja.dto.product;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ProductCondition {

	private String conditionSelect;
	private String conditionName;
	private int conditionStart;
	private int conditionEnd;
	
	
}
