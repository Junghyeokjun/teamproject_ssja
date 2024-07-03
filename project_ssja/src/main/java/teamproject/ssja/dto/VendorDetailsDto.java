package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class VendorDetailsDto {	
	long v_no; 
	String m_id; 
	String m_name; 
	String v_bizname; 
	String v_license;
}
