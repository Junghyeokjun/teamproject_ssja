package teamproject.ssja.dto;

import lombok.Data;

@Data
public class UserRoleAndAuthDTO {
	
	private String userNickName;
	private String userAuth;
	public UserRoleAndAuthDTO(String m_Name, String auth) {
		this.userNickName=m_Name;
		this.userAuth = auth;
	}

}
