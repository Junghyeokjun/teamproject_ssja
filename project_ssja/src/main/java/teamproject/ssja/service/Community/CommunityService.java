package teamproject.ssja.service.Community;

import java.util.List;

import teamproject.ssja.dto.community.CommunityBoardDto;



public interface CommunityService {
	long getCommunityTotal();
	List<CommunityBoardDto> getPost(int pageNum,int amount);

}
