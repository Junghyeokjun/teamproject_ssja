package teamproject.ssja.service.Community;

import java.util.List;

import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.community.CommunityBoardDto;



public interface CommunityService {
	long getCommunityTotal();
	List<CommunityBoardDto> getPost(int pageNum,int amount);
	CommunityBoardDto getContent(long bno);
	List<ReplysDto> getReply(int replyNum,int amount, long bno);
	long getReplyTotal(long bno);
	int insertReply(ReplysDto reply);
}
