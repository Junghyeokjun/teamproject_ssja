package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이름        널?       유형             
//--------- -------- -------------- 
//B_NO      NOT NULL NUMBER(20)     
//M_NO      NOT NULL NUMBER(20)     
//B_C_NO    NOT NULL NUMBER(20)     
//B_WRITER  NOT NULL VARCHAR2(30)   
//B_TITLE   NOT NULL VARCHAR2(250)  
//B_CONTENT NOT NULL VARCHAR2(4000) 
//B_DATE    NOT NULL TIMESTAMP(6)   
//B_LIKE    NOT NULL NUMBER(10)     
//B_HIT     NOT NULL NUMBER(10)     
//B_EVAL             NUMBER(3)      
//PRO_NO             NUMBER(20)

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class QnaSearchDto {
	private long B_NO;
	private long M_NO;
	private long B_C_NO;
	private String B_WRITER;
	private String B_TITLE;
	private String B_CONTENT;
	private String B_DATE;
	private long B_LIKE;
	private long B_HIT;
	private long B_EVAL;
	private long PRO_NO;
	
	//검색필터
		private String type;//검색 타입
		private String keyword;//검색 내용
	
}
