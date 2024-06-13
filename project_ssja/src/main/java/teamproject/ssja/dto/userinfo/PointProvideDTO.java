package teamproject.ssja.dto.userinfo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import teamproject.ssja.page.ListObjectPaging5DTO;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class PointProvideDTO {
	
	private ListObjectPaging5DTO data;
	private int totalPoint;

}
