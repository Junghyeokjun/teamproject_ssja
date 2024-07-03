package teamproject.ssja.dto;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

//이름         널?       유형            
//---------- -------- ------------- 
//M_NO       NOT NULL NUMBER(20)    
//M_ID       NOT NULL VARCHAR2(25)  
//M_PW       NOT NULL VARCHAR2(60)  
//M_NAME     NOT NULL VARCHAR2(25)  
//M_ADDRESS1 NOT NULL VARCHAR2(150) 
//M_ADDRESS2 NOT NULL VARCHAR2(60)  
//M_ZIPCODE  NOT NULL VARCHAR2(10)  
//M_BIRTH    NOT NULL TIMESTAMP(6)  
//M_GRADE    NOT NULL VARCHAR2(10)  
//M_EMAIL    NOT NULL VARCHAR2(25)  
//M_PHONE    NOT NULL VARCHAR2(25)  
//M_POINT    NOT NULL NUMBER(10)    
//M_DATE     NOT NULL TIMESTAMP(6)  
//M_NICKNAME NOT NULL VARCHAR2(40) 
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class MembersDto {
	private long M_NO;
	private String M_ID;
	private String M_PW;
	private String M_NAME;
	private String M_ADDRESS1;
	private String M_ADDRESS2;
	private String M_ZIPCODE;
	private Date M_BIRTH;
	private String M_GRADE;
	private String M_EMAIL;
	private String M_PHONE;
	private int M_POINT;
	private String M_DATE;
	private String M_NICKNAME;
	
	
	public void setM_BIRTH(String M_BIRTH) {
		java.util.Date date = null;
		 SimpleDateFormat format = new SimpleDateFormat("yyMMdd");
		 try {
			date= format.parse(M_BIRTH);
		} catch (ParseException e) {
		}
		 this.M_BIRTH =(new Date(date.getTime()));

	}
}
