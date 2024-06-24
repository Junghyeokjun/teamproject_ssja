package teamproject.ssja.service.Admin;

import java.util.List;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.page.Criteria;

public interface MemberListService {

	long getMemberListTotalCount();
	List<MembersDto> getMemberListWithPaging(Criteria cri);
	//검색리스트
	List<MembersSearchDto> getMemberSearchList(String type, String keyword);
	

	
}
