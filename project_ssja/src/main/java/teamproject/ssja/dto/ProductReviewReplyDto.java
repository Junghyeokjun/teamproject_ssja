package teamproject.ssja.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductReviewReplyDto {
	private long PRO_NO;
	private long R_NO;
	private long B_NO;
	private String R_WRITER;
	private String R_CONTENT;
	private Date R_DATE;
}
