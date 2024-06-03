package teamproject.ssja.dto.vendor;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VendorInfoDTO {

	private long v_no;
	private long id;
	private String v_license;
	private  String v_FAX;
	private  String v_bizName;
	private String  v_account;
}
