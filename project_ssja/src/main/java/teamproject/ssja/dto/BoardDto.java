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
public class BoardDto {
	private long bno;
	private long mno;
	private long bcno;
	private String bwriter;
	private String btitle;
	private String bcontent;
	private String bdate;
	private long blike;
	private long bhit;
	private long beval;
	private long prono;
}
