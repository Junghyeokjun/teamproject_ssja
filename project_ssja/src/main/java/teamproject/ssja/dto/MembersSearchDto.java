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
public class MembersSearchDto {
	private long M_NO;
	private String M_ID;
	private String M_PW;
	private String M_NAME;
	private String M_ADDRESS1;
	private String M_ADDRESS2;
	private String M_ZIPCODE;
	private String M_BIRTH;
	private String M_GRADE;
	private String M_EMAIL;
	private String M_PHONE;
	private int M_POINT;
	private String M_DATE;
	private String M_NICKNAME;
	
	//검색필터
	private String type;//검색 타입
	private String keyword;//검색 내용
}
