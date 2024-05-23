package teamproject.ssja.dto;

//이름            널?       유형            
//------------- -------- ------------- 
//PRO_NO        NOT NULL NUMBER(20)    
//V_NO          NOT NULL NUMBER(20)    
//P_C_NO        NOT NULL NUMBER(20)    
//PRO_PRICE     NOT NULL NUMBER(10)    
//PRO_QUANTITY  NOT NULL NUMBER(5)     
//PRO_BANNERIMG NOT NULL VARCHAR2(300) 
//PRO_WISH      NOT NULL NUMBER(10)    
//PRO_SELLCOUNT NOT NULL NUMBER(10)    
//PRO_HIT       NOT NULL NUMBER(10)    
//PRO_BIZNAME   NOT NULL VARCHAR2(30)  
//PRO_NAME      NOT NULL VARCHAR2(60)  

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
public class ProductDto {
	long PRO_NO;
	long V_NO;   
	long P_C_NO;   
	long PRO_PRICE;   
	long PRO_QUANTITY;   
	String PRO_BANNERIMG;
	long PRO_WISH;
	long PRO_SELLCOUNT;
	long PRO_HIT;
	String PRO_BIZNAME;
	String PRO_NAME; 
	
}
