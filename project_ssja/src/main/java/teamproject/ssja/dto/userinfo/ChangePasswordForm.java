package teamproject.ssja.dto.userinfo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class ChangePasswordForm {

	private String currentPassword;
	private String newPassword;
}
