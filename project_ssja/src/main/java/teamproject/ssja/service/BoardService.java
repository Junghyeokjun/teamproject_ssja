package teamproject.ssja.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.page.Criteria;



public interface BoardService {
	//List<BoardDto> showList();
	int addBoard(BoardDto boardDto);
	int removeBoard(BoardDto boardDto);	
	BoardDto showContent(HttpServletRequest request, HttpServletResponse response); 
	// 조회수 처리 내장됨.
	
	int modifyBoard(BoardDto boardDto);
	public void upHit(HttpServletRequest request, HttpServletResponse response, Long bno);
	public void setCookie(HttpServletResponse response, String name, String value, int maxAge);
	public String getCookieValue(HttpServletRequest request, String name);
	public long getTotal();
	public List<BoardDto> showListWithPaging(Criteria criteria);
	public long modifyGetBoardLikes(Boolean liked, long bno);
	
	public List<ReplysDto> showReplys();
	int addReply(ReplysDto replysDto);
	int modifyReply(ReplysDto replysDto);
	int removeReply(ReplysDto replysDto);

	// 해당 댓글 좋아요 처리 및 해당 댓글의 좋아요 수 리턴 
	long modifyGetReplyLikes(Boolean liked, Long rno);
}
