package teamproject.ssja.dto.vendor;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import teamproject.ssja.dto.community.CommunityBoardDto;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TotalVendorInfoDto {
	
	private VendorEtcInfoDTO info;
	private List<CommunityBoardDto> commuList;
	
}
