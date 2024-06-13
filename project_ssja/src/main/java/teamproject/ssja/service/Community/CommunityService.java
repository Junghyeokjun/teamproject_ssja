package teamproject.ssja.service.Community;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.community.CommunityBoardDto;



public interface CommunityService {
	
	//게시물 총개수 얻어오는 메서드
	long getCommunityTotal();
	//검색요건에 맞는 게시물의 총개수를 얻어오는 메서드
	long getCommunitySearchTotal(String option, String keyword);
	//검색요건에 맞는 게시물의 리스트를 얻어오는 메서드
	List<CommunityBoardDto> getSearchPost(int pageNum, int amount, String option, String keyword);
	//게시물 리스트 얻어오는 메서드
	List<CommunityBoardDto> getPost(int pageNum,int amount);
	//베스트 게시물 리스트 얻어오는 메서드
	List<CommunityBoardDto> getBestPost();
	//게시물 내용 얻어오는 메서드
	CommunityBoardDto getContent(long bno);
	//게시물 입력 메서드
	long insertPost(BoardDto post);
	//게시물을 삭제하는 메서드
	int deletePost (long bno);
	//게시물 좋아요 개수 얻어오는 메서드
	long getBoardLikedTotal(long bno);
	//게시물 좋아요를 추가하는 메서드
	int insertBoardLiked(BoardIsLikedDto liked);
	//게시물에 해당 회원이 좋아요를 추가한 이력이 있는지 확인하는 메서드
	BoardIsLikedDto getBoardLiked(BoardIsLikedDto liked);
	//게시글 업데이트 메서드
	int modifyContent(BoardDto content);
	//게시글 임시 이미지 업데이트 메서드	
	String updateTempBoardImg(long bno,MultipartFile file);	
	//게시글 입력시 임시 이미지 삭제 메서드
	boolean deleteTempBoardImg(long randomNum);
	//게시글 이미지 업데이트 메서드	
	boolean updateBoardImg(long bno,MultipartFile file);
	//게시글 이미지 삭제 메서드
	int deleteBoardImg(long bno);
	
	
	
	//댓글 리스트 얻어오는 메서드
	List<ReplysDto> getReply(int replyNum,int amount, long bno);
	//댓글 총개수 얻어오는 메서드
	long getReplyTotal(long bno);
	//댓글 입력 메서드
	int insertReply(ReplysDto reply);
	//댓글 수정 메서드
	int updateReply(ReplysDto reply);
	//댓글 삭제 메서드
	int deleteReply(long rno);
	
	
	
}
