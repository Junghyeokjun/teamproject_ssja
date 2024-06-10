package teamproject.ssja.dto.mainpage;

import java.util.List;

import lombok.Getter;
import lombok.Setter;
import teamproject.ssja.dto.product.ProductItemDto;

@Getter @Setter
public class MainPageDTO {

	private List<EventInfoDTO> eventList;
	private List<ProductItemDto> bestList;
	private List<ProductItemDto> categoryItemList;
	
	public MainPageDTO(List<EventInfoDTO> eventList, List<ProductItemDto> bestList, List<ProductItemDto> categoryItemList) {
		this.eventList = eventList;
		this.bestList = bestList;
		this.categoryItemList = categoryItemList;
	}
	
	
}
