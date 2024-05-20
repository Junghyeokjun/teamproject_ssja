package teamproject.ssja.dto.logindto;

import javax.validation.constraints.NotEmpty;

import lombok.Data;

@Data
public class LoginFormDTO {
	@NotEmpty
	private String username;
	@NotEmpty
	private String password;
	

}
