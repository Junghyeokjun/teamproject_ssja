package teamproject.ssja.dto;
//이름            널?       유형            
//------------- -------- ------------- 
//PRO_NO        NOT NULL NUMBER(20)    
//V_NO          NOT NULL NUMBER(20)    
//P_C_NO        NOT NULL NUMBER(20)    
//PRO_PRICE     NOT NULL VARCHAR2(25)  
//PRO_QUANTITY  NOT NULL VARCHAR2(25)  
//PRO_BANNERIMG NOT NULL VARCHAR2(300) 
//PRO_WISH      NOT NULL NUMBER(10)    
//PRO_SELLCOUNT NOT NULL NUMBER(10)    
//PRO_HIT       NOT NULL NUMBER(10)    
//PRO_BIZNAME   NOT NULL VARCHAR2(30)  

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ProductDetailDto {
	long PRO_NO;
	long V_NO;   
	String PRO_NAME;
	String PRO_PRICE;
	String PRO_QUANTITY;
	String PRO_BANNERIMG;
	long PRO_WISH;
	long PRO_SELLCOUNT;
	long PRO_HIT;
	String PRO_BIZNAME;
	long M_NO;   
	String V_BIZNAME;
	String V_LICENSE;
	String M_NAME;
	String M_ADDRESS1;
	String M_ADDRESS2;
	String M_ZIPCODE;
	String M_EMAIL;
	String M_PHONE;
	String B_WRITER;
	
	private String PRO_DATE;
	
	public String getPRO_NAMEStr() {
		int endIndex = PRO_NAME.indexOf(']');
		
		 // ']' 이후의 문자열 추출
        String result;
        if (endIndex != -1) {
            result = PRO_NAME.substring(endIndex + 1).trim(); // 공백 제거를 위해 trim() 사용
        } else {
            result = PRO_NAME; // ']'가 없으면 전체 문자열 반환
        }

		return result;
	}
}
