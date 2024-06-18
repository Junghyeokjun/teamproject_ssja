package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.BoardCategoryDto;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardImgsDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
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
	//게시글의 상품번호를 삭제
	int deleteBoardProduct(long bno);
	
	//게시글의 상품번호를 업데이트
	int updateBoardProduct(long bno, long proNo);
	
	// 판매자(작성자) 자신의 QnA 작성글 가져오기
	List<BoardDto> selectMemberQnaList(Criteria criteria);
	
	List<BoardCategoryDto> selectBoardCategorys(); 
	BoardCategoryDto selectBoardCategory(String category);
	BoardCategoryDto selectBC(long bcno);
	
	long selectTotalCount(long bcno);
	long selectSearchTotalCount(long bcno,String option, String keyword);
	List<BoardDto> selectListWithPaging(Criteria criteria);

	//커뮤니티용 게시글들을 가져오는 메서드
	List<CommunityBoardDto> selectCommunityDto(int pageNum,int amount);
	
	//검색조건에 맞는 커뮤니티 게시글들을 가져오는 메서드
	List<CommunityBoardDto> selectSearchCommunityDto(int pageNum,int amount,String option, String keyword);

	//커뮤니티용 베스트 게시글들을 가져오는 메서드
	List<CommunityBoardDto> selectBestCommunityDto();
	
	//커뮤니티 게시글을 가져오는 메서드
	CommunityBoardDto selectCommunityContent(long bno);
	
	// 해당 게시글의 총 좋아요 수 가져오기
	long selectBoardLikes(long bno);
	
	// 해당 게시글에 해당 멤버의 좋아요가 있는지 확인
	BoardIsLikedDto selectBIsLiked(BoardIsLikedDto boardIsLiked);
	
	// 해당 게시글 좋아요를 누르면 해당 게시글의 해당 멤버 좋아요 상태 추가
	int insertBLiked(BoardIsLikedDto boardIsLiked);
	
	int updateBLikeUp(long bno);
	
	// 좋아요가 된 상태에서, 해당 게시글 좋아요를 다시 누르면 해당 게시글의 해당 멤버 좋아요 상태 제거
	int deleteBLiked(BoardIsLikedDto boardIsLiked);
	
	// 게시글을 삭제할때 forignkey를 없애기 위해 모든 좋아요를 삭제하는 메서드
	int deleteAllBLiked(long bno);
	
	int updateBLikeDown(long bno);
	
	// 게시글의 이미지가 존재하는지 체크하는 메서드
	int selectBoardImg(long bno);
		
	// 게시글의 이미지경로를 DB에 업로드하는 메서드
	int insertBoardImg(BoardImgsDto boardImg);

	//게시글의 이미지를 업데이트하는 메서드
	int updateBoardImg(BoardImgsDto boardImg);
	
	//게시글의 이미지 경로를 삭제하는 메서드
	int deleteBoardImg(long bno);
	
	//마이페이지 내가 쓴글 메서드
	List<CommunityBoardDto> getMyCommus(Long id, Integer pageNum);
	List<BoardDto> getMyQnAs(Long id, Integer pageNum);
	// 
	//게시글의 최신공지사항을 얻어오는 메서드
	BoardDto selectNotice();
	
} 
