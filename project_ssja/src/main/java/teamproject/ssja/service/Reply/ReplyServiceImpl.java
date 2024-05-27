package teamproject.ssja.service.Reply;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.dto.ReplyIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.mapper.BoardMapper;
import teamproject.ssja.mapper.ReplyMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	ReplyMapper replyMapper;

	@Override
	public List<ReplysDto> showReplys(long bno) {
		return replyMapper.selectReplys(bno);
	}

	@Override
	public int addReply(ReplysDto replysDto) {
		replyMapper.updateShape(replysDto);
		return replyMapper.insertReply(replysDto);
	}

	@Override
	public int modifyReply(ReplysDto replysDto) {
		return replyMapper.updateReply(replysDto);
	}

	@Override
	public int removeReply(ReplysDto replysDto) {
		return replyMapper.deleteReply(replysDto);
	}

	@Override
	public LikesVO modifyGetReplyLikes(String rno, String rmo) {
		long noLong = Long.valueOf(rno);
		long moLong = Long.valueOf(rmo);

		ReplyIsLikedDto replyIsLikedDto = new ReplyIsLikedDto(noLong, moLong);
		
		long beforeLikes = replyMapper.selectReplyLikes(noLong);
		
		ReplyIsLikedDto isLiked = replyMapper.selectRIsLiked(replyIsLikedDto);
		
		if (isLiked != null) {
			replyMapper.updateRLikeUp(noLong);
			replyMapper.deleteRLiked(isLiked);
		} else {
			replyMapper.insertRLiked(isLiked);
			replyMapper.updateRLikeDown(noLong);
		}

		long afterLikes = replyMapper.selectReplyLikes(noLong);
		
		LikesVO likes = new LikesVO(beforeLikes, afterLikes, (afterLikes - beforeLikes));
		
		return likes;
	}

	@Override
	public long getTotal(long bno) {
		return replyMapper.selectReplyCount(bno);
	}

}
