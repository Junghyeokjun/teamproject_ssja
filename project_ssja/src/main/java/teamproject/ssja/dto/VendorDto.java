package teamproject.ssja.dto;

/*이름        널?       유형           
--------- -------- ------------ 
V_NO      NOT NULL NUMBER(20)   
M_NO      NOT NULL NUMBER(20)   
V_BIZNAME NOT NULL VARCHAR2(30) 
V_ACCOUNT NOT NULL VARCHAR2(30) 
V_LICENSE NOT NULL VARCHAR2(30) 
V_FAX     NOT NULL VARCHAR2(20) */

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
public class VendorDto {
	long V_NO;
	long M_NO;   
	String V_BIZNAME;
	String V_ACCOUNT;
	String V_LICENSE;
	String V_FAX;
}
