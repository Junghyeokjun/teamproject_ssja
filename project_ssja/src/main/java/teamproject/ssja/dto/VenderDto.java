package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//이름        널?       유형           
//--------- -------- ------------ 
//V_NO      NOT NULL NUMBER(20)   
//M_NO      NOT NULL NUMBER(20)   
//V_BIZNAME NOT NULL VARCHAR2(30) 
//V_ACCOUNT NOT NULL VARCHAR2(30) 
//V_LICENSE NOT NULL VARCHAR2(30) 
//V_FAX     NOT NULL VARCHAR2(20)

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class VenderDto {
	private long vno;
	private long vmno;
	private String vbizname;
	private String vaccount;
	private String vlicense;
	private String vfax;
}
