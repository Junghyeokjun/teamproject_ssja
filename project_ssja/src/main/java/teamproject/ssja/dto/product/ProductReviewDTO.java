package teamproject.ssja.dto.product;

import java.sql.Date;

import lombok.Data;

@Data
public class ProductReviewDTO {
	private Long b_no;
	private Long m_no;
	private int b_c_no;
	private String b_writer;
	private String b_content;
	private Date b_date;
	private double b_eval;
	private Long pro_no;
	private int total;
	private String rv_img;

}
