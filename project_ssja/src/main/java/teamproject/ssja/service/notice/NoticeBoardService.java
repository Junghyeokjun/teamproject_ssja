package teamproject.ssja.service.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.page.Criteria;

public interface NoticeBoardService {	
	BoardDto showContent(HttpServletRequest request, HttpServletResponse response); 

	public long getTotal();
	public List<BoardDto> showListWithPaging(Criteria criteria);

}
