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
public class BoardIsLikedDto {
	private long likebno;
	private long likebmno;
	private String bldate;
	
	public BoardIsLikedDto(long likebno, long likebmno) {
		this.likebno = likebno;
		this.likebmno = likebmno;
	}	
}
