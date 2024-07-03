package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이름            널?       유형            
//------------- -------- ------------- 
//O_NO        NOT NULL NUMBER(20)   
//PUR_NO      NOT NULL NUMBER(20)   
//PRO_NO      NOT NULL NUMBER(20)   
//O_QUANTITY  NOT NULL NUMBER(10)   
//O_DISCOUNT  NOT NULL NUMBER(20)   
//O_PRICE     NOT NULL NUMBER(20)   
//O_PAY       NOT NULL NUMBER(20)   
//O_USECOUPON NOT NULL NUMBER(20)   
//O_STATE     NOT NULL VARCHAR2(20) 


@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderDetailsDto {
	private long O_NO;
	private long M_NO;
	private String PRO_NAME;
	private long O_QUANTITY;	
}
