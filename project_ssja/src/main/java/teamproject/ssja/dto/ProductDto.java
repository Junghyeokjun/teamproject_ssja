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

import java.sql.Timestamp;

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
	String PRO_NAME;
	String PRO_PRICE;
	String PRO_QUANTITY;
	String PRO_BANNERIMG;
	long PRO_WISH;
	long PRO_SELLCOUNT;
	long PRO_HIT;
	String PRO_BIZNAME;
}