package teamproject.ssja.dto.logindto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class SocialUserInfoDTO {
	
    private Long id;

    private String username;

    private  String email;

    private String auth;
    
    private String name;
    
    private String nickname;
    
    private String randomPw;
    
}
