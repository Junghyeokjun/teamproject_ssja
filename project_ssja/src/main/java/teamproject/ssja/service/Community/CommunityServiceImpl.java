package teamproject.ssja.service.Community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
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
	public List<CommunityBoardDto> getBestPost() {
		return boardMapper.selectBestCommunityDto();
	}

	@Override
	public long getCommunityTotal() {
		
		return boardMapper.selectTotalCount(40);
	}

	@Override
	public CommunityBoardDto getContent(long bno) {
		return boardMapper.selectCommunityContent(bno);
	}

	@Transactional
	@Override
	public int deletePost(long bno) {
		BoardDto board= new BoardDto();
		board.setBno(bno);
		replyMapper.deleteAllReply(bno);
//		boardMapper.deleteAllBLiked(bno);
		return boardMapper.deleteBoard(board);
	}
	
	@Override
	public List<ReplysDto> getReply(int replyNum, int amount, long bno) {
		return replyMapper.selectPartReplys(replyNum, amount, bno);
	}

	@Override
	public long getReplyTotal(long bno) {
		return replyMapper.selectReplyCount(bno);
	}

	@Override
	public int insertReply(ReplysDto reply) {
		int replyResult=0;
		if(reply.getRgroup()==0) {
			replyResult= replyMapper.insertReply(reply);
		}else {
			replyMapper.updateShape(reply);
			replyResult=replyMapper.insertReReply(reply);
		}
		
		return replyResult;
	}

	@Override
	public long getBoardLikedTotal(long bno) {
		return boardMapper.selectBoardLikes(bno);
	}

	@Override
	public int insertBoardLiked(BoardIsLikedDto liked) {
		int result = boardMapper.insertBLiked(liked);
		boardMapper.updateBLikeUp(liked.getLikebno());
		return result;
	}

	@Override
	public BoardIsLikedDto getBoardLiked(BoardIsLikedDto liked) {
		return boardMapper.selectBIsLiked(liked);
	}



}
