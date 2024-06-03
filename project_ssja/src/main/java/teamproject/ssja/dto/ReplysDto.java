package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이름        널?       유형             
//--------- -------- -------------- 
//R_NO      NOT NULL NUMBER(20)     
//B_NO      NOT NULL NUMBER(20)     
//M_NO      NOT NULL NUMBER(20)     
//R_WRITER  NOT NULL VARCHAR2(30)   
//R_CONTENT NOT NULL VARCHAR2(4000) 
//R_DATE    NOT NULL TIMESTAMP(6)   
//R_LIKE    NOT NULL NUMBER(10)     
//R_GROUP            NUMBER(20)     
//R_STEP             NUMBER(10)     
//R_INDENT           NUMBER(10) 

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ReplysDto {
	private long rno;
	private long rbno;
	private long rmno;
	private String rwriter;
	private String rcontent;
	private String rdate;
	private long rlike;
	private long rgroup;
	private long rstep;
	private long rindent;
	
	// 조인을 위한 데이터 (member 테이블)
	private String rmid; // id 
	private String rmnickname; // 닉네임
	
	// 댓글 데이터 조작 시 사용(insert, update, delete)
	public ReplysDto(long rno, long rbno, long rmno, String rwriter, String rcontent, String rdate, long rlike,
			long rgroup, long rstep, long rindent) {
		this.rno = rno;
		this.rbno = rbno;
		this.rmno = rmno;
		this.rwriter = rwriter;
		this.rcontent = rcontent;
		this.rdate = rdate;
		this.rlike = rlike;
		this.rgroup = rgroup;
		this.rstep = rstep;
		this.rindent = rindent;
	}	
}
