package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.ReplyIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.page.Criteria;

@Mapper
public interface BoardMapper {
	// List<BoardDto> selectList();
	// 게시글 
	int insertBoard(BoardDto boardDto);
	int deleteBoard(BoardDto boardDto);
	BoardDto read(long bno);
	int updateBoard(BoardDto boardDto);
	int updateHit(long bno);
	
	long selectTotalCount(long bcno);
	List<BoardDto> selectListWithPaging(Criteria criteria);
	
	// 해당 게시글의 총 좋아요 수 가져오기
	long selectBoardLikes(long bno);
	
	// 해당 게시글에 해당 멤버의 좋아요가 있는지 확인
	BoardIsLikedDto selectBIsLiked(BoardIsLikedDto boardIsLiked);
	
	// 해당 게시글 좋아요를 누르면 해당 게시글의 해당 멤버 좋아요 상태 추가
	int insertBLiked(BoardIsLikedDto boardIsLiked);
	
	int updateBLikeUp(long bno);
	
	// 좋아요가 된 상태에서, 해당 게시글 좋아요를 다시 누르면 해당 게시글의 해당 멤버 좋아요 상태 제거
	int deleteBLiked(BoardIsLikedDto boardIsLiked);
	
	int updateBLikeDown(long bno);
} 
