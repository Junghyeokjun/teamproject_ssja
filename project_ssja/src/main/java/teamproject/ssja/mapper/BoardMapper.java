package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.page.Criteria;

@Mapper
public interface BoardMapper {
	//List<BoardDto> selectList();
	int insertBoard(BoardDto boardDto);
	int deleteBoard(BoardDto boardDto);
	BoardDto read(long bno);
	int updateBoard(BoardDto boardDto);
	int updateHit(long bno);
	int updateBLikeUp(long bno);
	int updateBLikeDown(long bno);
	long selectTotalCount();
	List<BoardDto> selectListWithPaging(Criteria criteria);
	long selectBoardLikes(long bno);
	
	// 댓글 
	int insertReply(ReplysDto replysDto);
	int updateShape(ReplysDto replysDto);
	int updateReply(ReplysDto replysDto);
	int deleteReply(ReplysDto replysDto);
	List<ReplysDto> selectReplys();
	int updateRLikeUp(long rno);
	int updateRLikeDown(long rno);
	long selectReplyLikes(long rno);
	
} 
