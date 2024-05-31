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
	private long beforeLikes;
	private long afterLikes;
	// 총 좋아요 수가 늘었는가? 변화가 없는가? 
	// 즉, 0 or 1 or -1로 구분하는 것
	// 좋아요를 계속 변화시키는 경우에는 isLiked 값이 -1, 1 두 가지가 나온다.
	// 좋아요를 처음 가져오는 경우에는 isLiked 값이 0, 1 두 가지가 나온다. 
	// isLiked는 결국, 로그인한 유저의 기록이 있냐 없냐에 따라 달라지는 것.
	private long isLiked;
}
