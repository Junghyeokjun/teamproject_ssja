package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import oracle.sql.TIMESTAMP;

//이름          널?       유형           
//----------- -------- ------------ 
//C_NO        NOT NULL NUMBER(20)   
//C_STARTDATE NOT NULL TIMESTAMP(6) 
//C_DUEDATE   NOT NULL TIMESTAMP(6) 
//C_NAME      NOT NULL VARCHAR2(90) 
//C_DCPER     NOT NULL NUMBER(10) 

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class CouponDto {
	private int C_NO;
	private String C_STARTDATE;
	private String C_DUEDATE;
	private String C_NAME;
	private int C_DCPER;
}
