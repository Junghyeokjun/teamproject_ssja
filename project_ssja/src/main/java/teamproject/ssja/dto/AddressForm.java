package teamproject.ssja.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class AddressForm {

	private String zip_code;
	private String address;
	private String extra_address;
	private long userId;
	
	
}
