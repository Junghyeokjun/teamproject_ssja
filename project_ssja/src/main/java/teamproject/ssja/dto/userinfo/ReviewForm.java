package teamproject.ssja.dto.userinfo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ReviewForm {

	private Long id;
	private String writer;
	private String content;
	private int eval;
	private Long proNum;
}
