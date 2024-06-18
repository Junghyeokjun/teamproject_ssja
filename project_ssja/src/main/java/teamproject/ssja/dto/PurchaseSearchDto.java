package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이름            널?       유형            
//------------- -------- ------------- 
//PUR_NO        NOT NULL NUMBER(20)    
//M_NO          NOT NULL NUMBER(20)    
//PUR_TOT       NOT NULL NUMBER(20)    
//PUR_DC        NOT NULL NUMBER(20)    
//PUR_PAY       NOT NULL NUMBER(20)    
//PUR_PAYMENT   NOT NULL VARCHAR2(30)  
//PUR_DATE      NOT NULL TIMESTAMP(6)  
//PUR_DVADDRESS NOT NULL VARCHAR2(200) 
//PUR_DV        NOT NULL VARCHAR2(30)

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PurchaseSearchDto {
	private long PUR_NO;
	private long M_NO;
	private long PUR_TOT;
	private long PUR_DC;
	private long PUR_PAY;
	private String PUR_PAYMENT;
	private String PUR_DATE;
	private String PUR_DVADDRESS;
	private String PUR_DV;
	
	// 검색필터
		private String type;// 검색 타입
		private String keyword;// 검색 내용
}
