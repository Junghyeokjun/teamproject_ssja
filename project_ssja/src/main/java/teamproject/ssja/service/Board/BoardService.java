package teamproject.ssja.service.Board;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teamproject.ssja.dto.BoardCategoryDto;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.page.Criteria;



public interface BoardService {
	//List<BoardDto> showList();
	List<BoardCategoryDto> showBoardCategorys();
	BoardCategoryDto showBoardCategory(String categoryName);
	BoardCategoryDto showBoardCategory(long categoryNo);
	
	int addBoard(BoardDto boardDto);
	int removeBoard(BoardDto boardDto);	
	BoardDto showContent(HttpServletRequest request, HttpServletResponse response); 
	// 조회수 처리 내장됨.
	
	int modifyBoard(BoardDto boardDto);
	public void upHit(HttpServletRequest request, HttpServletResponse response, Long bno);
	public void setCookie(HttpServletResponse response, String name, String value, int maxAge);
	public String getCookieValue(HttpServletRequest request, String name);
	public long getTotal(long category);
	
	// 페이징
	public List<BoardDto> showListWithPaging(Criteria criteria);
	// 해당 게시글의 좋아요 수 리턴
	public LikesVO getBoardLikes(String bno, String mno);	
	// 해당 게시글 좋아요 처리 및 해당 게시글의 좋아요 수 리턴
	public LikesVO modifyGetBoardLikes(String no, String liked);

}
