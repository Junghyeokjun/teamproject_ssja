package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

//이름   널?       유형           
//---- -------- ------------ 
//M_ID NOT NULL VARCHAR2(25) 
//AUTH NOT NULL VARCHAR2(15)  

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class AuthDto {
	private String M_ID;
	private String AUTH;
}
