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
public class ReplyIsLikedDto {
	private long likerno;
	private long likermno;
	private String rldate;
	
	public ReplyIsLikedDto(long likerno, long likermno) {
		this.likerno = likerno;
		this.likermno = likermno;
	}	
}
