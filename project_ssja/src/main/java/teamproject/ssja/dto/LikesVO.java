package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class LikesVO {
	private Long beforeLikes;
	private Long afterLikes;
	// 총 좋아요 수가 늘었는가? 변화가 없는가? 
	// 즉, 0 or 1로 구분하는 것	
	private long isLiked;
}
