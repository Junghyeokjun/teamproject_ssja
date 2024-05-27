package teamproject.ssja.dto.email;

import lombok.Data;

@Data
public class MailDTO {

    private String receiver;
    private String title;
    private String content;
    private String authNum;
}