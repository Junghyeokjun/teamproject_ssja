package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Update;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.ReplyIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.userinfo.ReviewForm;
import teamproject.ssja.page.Criteria;

@Mapper
public interface ReplyMapper {	
	// 댓글 입력 
	int insertReply(ReplysDto replysDto);
	
	int insertReReply(ReplysDto replysDto);
	
	int updateShape(ReplysDto replysDto);
	
	int updateRShape(ReplysDto replysDto);
	
	int updateReply(ReplysDto replysDto);
	
	int deleteReply(ReplysDto replysDto);

	//한 게시물의 모든 댓글을 삭제하는 메서드
	int deleteAllReply(long bno);

	//댓글 삭제시 대댓글이 존재할경우 대댓글이 다른 대댓글처럼 보이지 않기위하여 내용을 수정하는 메서드
	int updateDeleteReply(ReplysDto reply);
	
	//특정 댓글을 가져오는 메서드
	ReplysDto selectReply(long rno);
	
	List<ReplysDto> selectReplys(long bno);

	List<ReplysDto> selectPartReplys(int replyNum, int amount, long bno);

	// 해당 게시글의 총 댓글 개수 가져오기
	long selectReplyCount(long bno);

	// 해당 게시글의 대댓글 존재여부 확인
	long selectReReplyCount(ReplysDto reply);
	
	
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
	
	@Update("insert into board values (b_seq.nextval, #{id}, 30, #{writer},concat('review',#{proNum}) ,"
			+ "#{content}, sysdate, 0, 0 ,#{eval}, #{proNum})")
	void applyReview(ReviewForm form);
	
	@Insert("insert into points values (pt_seq.nextval, #{id}, 1, 1000, '리뷰 포인트', sysdate)")
	void reviewGiftPoint(long id);
} 
