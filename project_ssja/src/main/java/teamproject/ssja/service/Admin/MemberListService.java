package teamproject.ssja.service.Admin;

import java.util.List;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.page.Criteria;

public interface MemberListService {

	long getMemberListTotalCount();
	List<MembersDto> getMemberListWithPaging(Criteria cri);

}
