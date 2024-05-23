package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.ReplyIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.page.Criteria;

@Mapper
public interface ReplyMapper {	
	// 댓글 입력 
	int insertReply(ReplysDto replysDto);
	
	int insertReReply(ReplysDto replysDto);
	
	int updateShape(ReplysDto replysDto);
	
	int updateReply(ReplysDto replysDto);
	
	int deleteReply(ReplysDto replysDto);
	
	List<ReplysDto> selectReplys(long bno);


	
	// 해당 댓글의 총 좋아요 수 가져오기
	long selectReplyLikes(long rno);
	
	// 해당 댓글에 해당 멤버의 좋아요가 있는지 확인
	ReplyIsLikedDto selectRIsLiked(ReplyIsLikedDto replyIsLiked);
	
	// 해당 댓글 좋아요를 누르면 해당 게시글의 해당 멤버 좋아요 상태 추가
	int insertRLiked(ReplyIsLikedDto replyIsLiked);
	
	int updateRLikeUp(long rno);
	// 좋아요가 된 상태에서, 해당 댓글 좋아요를 다시 누르면 해당 게시글의 해당 멤버 좋아요 상태 제거
	int deleteRLiked(ReplyIsLikedDto replyIsLiked);
	
	int updateRLikeDown(long rno);
} 
