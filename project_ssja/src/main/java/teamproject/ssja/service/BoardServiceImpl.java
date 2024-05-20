package teamproject.ssja.service;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.mapper.BoardMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class BoardServiceImpl implements BoardService {
	
	@Autowired
	BoardMapper boardMapper;	
    // 쿠키 이름 설정
    private static final String VIEW_COOKIE_NAME = "pageViewLimit";

//    @Override
//	public List<BoardDto> showList() {    	
//		return boardMapper.selectList();
//	}

	@Override
	public int addBoard(BoardDto boardDto) {
		return boardMapper.insertBoard(boardDto);
	}

	@Override
	public int removeBoard(BoardDto boardDto) {
		return boardMapper.deleteBoard(boardDto);
	}

	@Override
	public BoardDto showContent(HttpServletRequest request, HttpServletResponse response) {
		long bno = Long.valueOf(request.getParameter("bno"));
		upHit(request,response,bno);
		return boardMapper.read(bno);
	}

	@Override
	public int modifyBoard(BoardDto boardDto) {
		return boardMapper.updateBoard(boardDto);
	} 
    
    public void upHit(HttpServletRequest request, HttpServletResponse response, Long bno) {
        // 쿠키를 통해 조회수 제한 체크
        String viewCookie = getCookieValue(request, VIEW_COOKIE_NAME);
        if (viewCookie == null) {
            // 쿠키가 없으면 조회수 증가 및 쿠키 설정
        	boardMapper.updateHit(bno);
            setCookie(response, VIEW_COOKIE_NAME, "visited", 300); // 5분(300초) 동안 유지
        }
    }
    
	public void setCookie(HttpServletResponse response, String name, String value, int maxAge) {
        Cookie cookie = new Cookie(name, value);
        cookie.setMaxAge(maxAge);
        cookie.setPath("/");
        response.addCookie(cookie);
    }
    
    public String getCookieValue(HttpServletRequest request, String name) {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(name)) {
                    return cookie.getValue();
                }
            }
        }
        return null;
    }

	// 페이징 관련
	
	@Override
	public long getTotal() {
		log.info("getTotal()..");
		return boardMapper.selectTotalCount();
	}

	@Override
	public List<BoardDto> showListWithPaging(Criteria criteria) {
		log.info("showListWithPaging()..");
		return boardMapper.selectListWithPaging(criteria);
	}

	
	@Override
	public List<ReplysDto> showReplys() {
		return boardMapper.selectReplys();
	}

	@Override
	public int addReply(ReplysDto replysDto) {
		boardMapper.updateShape(replysDto);
		return boardMapper.insertReply(replysDto);
	}

	@Override
	public int modifyReply(ReplysDto replysDto) {
		return boardMapper.updateReply(replysDto);
	}

	@Override
	public int removeReply(ReplysDto replysDto) {
		return boardMapper.deleteReply(replysDto);
	}

	@Override
	public long modifyGetReplyLikes(Boolean liked, Long rno) {
		if (liked) {
        	boardMapper.updateRLikeUp(rno);
        } else {
        	boardMapper.updateRLikeDown(rno);
        }
		return boardMapper.selectReplyLikes(rno);
	}

	@Override
	public long modifyGetBoardLikes(Boolean liked, long bno) {
		if (liked) {
        	boardMapper.updateBLikeUp(bno);
        } else {
        	boardMapper.updateBLikeDown(bno);
        }
		return boardMapper.selectBoardLikes(bno);
	}
}
