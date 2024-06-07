package teamproject.ssja.dto.product;

import java.util.List;

import lombok.Data;

@Data
public class ProductNumberDTO {

	private long id;
	private List<Integer> list;
	
	public ProductNumberDTO() {}
	
	public ProductNumberDTO(long id, List<Integer> list) {
		this.id = id;
		this.list = list;
	}
}
