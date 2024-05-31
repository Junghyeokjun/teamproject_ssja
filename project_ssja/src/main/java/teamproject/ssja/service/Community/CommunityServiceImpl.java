package teamproject.ssja.service.Community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.mapper.BoardMapper;
import teamproject.ssja.mapper.ReplyMapper;

@Slf4j
@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	ReplyMapper replyMapper;

	@Override
	public List<CommunityBoardDto> getPost(int pageNum, int amount) {
		return boardMapper.selectCommunityDto(pageNum, amount);
	}

	@Override
	public long getCommunityTotal() {
		
		return boardMapper.selectTotalCount(40);
	}

	@Override
	public CommunityBoardDto getContent(long bno) {
		return boardMapper.selectCommunityContent(bno);
	}

	@Override
	public List<ReplysDto> getReply(int replyNum, int amount, long bno) {
		return replyMapper.selectPartReplys(replyNum, amount, bno);
	}

	@Override
	public long getReplyTotal(long bno) {
		return replyMapper.selectReplyCount(bno);
	}

}
