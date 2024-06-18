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
	private long PRO_NO;
	private long V_NO;   
	private long P_C_NO;  
	private long PRO_PRICE;   
	private long PRO_QUANTITY;   
	private String PRO_BANNERIMG;
	private long PRO_WISH;
	private long PRO_SELLCOUNT;
	private long PRO_HIT;
	private String PRO_BIZNAME;
	private String PRO_NAME; 
	private String PRO_DATE; 
	private long avgeval;
	private Integer countrv;
	
}
