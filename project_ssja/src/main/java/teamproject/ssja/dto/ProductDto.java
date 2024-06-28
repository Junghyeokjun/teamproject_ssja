package teamproject.ssja.dto;

import com.fasterxml.jackson.annotation.JsonProperty;

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
    @JsonProperty("PRO_NO")
    private long PRO_NO;

    @JsonProperty("V_NO")
    private long V_NO;

    @JsonProperty("P_C_NO")
    private long P_C_NO;

    @JsonProperty("PRO_PRICE")
    private long PRO_PRICE;

    @JsonProperty("PRO_QUANTITY")
    private long PRO_QUANTITY;

    @JsonProperty("PRO_BANNERIMG")
    private String PRO_BANNERIMG;

    @JsonProperty("PRO_WISH")
    private long PRO_WISH;

    @JsonProperty("PRO_SELLCOUNT")
    private long PRO_SELLCOUNT;

    @JsonProperty("PRO_HIT")
    private long PRO_HIT;

    @JsonProperty("PRO_BIZNAME")
    private String PRO_BIZNAME;

    @JsonProperty("PRO_NAME")
    private String PRO_NAME;

    @JsonProperty("PRO_DATE")
    private String PRO_DATE;

    @JsonProperty("avgeval")
    private long avgeval;

    @JsonProperty("countrv")
    private Integer countrv;
	
}
