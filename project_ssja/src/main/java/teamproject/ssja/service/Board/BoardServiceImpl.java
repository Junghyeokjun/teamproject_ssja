package teamproject.ssja.service.Board;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardCategoryDto;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.LikesVO;
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
		upHit(request, response, bno);
		return boardMapper.read(bno);
	}

	@Override
	public int modifyBoard(BoardDto boardDto) {
		return boardMapper.updateBoard(boardDto);
	}

	public void upHit(HttpServletRequest request, HttpServletResponse response, Long bno) {
		// 쿠키를 통해 조회수 제한 체크
		String viewCookie = getCookieValue(request, VIEW_COOKIE_NAME + bno);
		if (viewCookie == null) {
			// 쿠키가 없으면 조회수 증가 및 쿠키 설정
			boardMapper.updateHit(bno);
			setCookie(response, VIEW_COOKIE_NAME + bno, "visited", 300); // 5분(300초) 동안 유지
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

	@Override
	public long getTotal(long category) {
		log.info("getTotal()..");
		return boardMapper.selectTotalCount(20);
	}

	
	// 페이징
	@Override
	public List<BoardDto> showListWithPaging(Criteria criteria) {
		log.info("showListWithPaging()..");
		criteria.setPRO_NO(20);
		return boardMapper.selectListWithPaging(criteria);
	}

	@Override
	public LikesVO getBoardLikes(String bno, String mno) {
		long bnoLong = Long.valueOf(bno);
		long mnoLong = Long.valueOf(mno);
		
		long likes = boardMapper.selectBoardLikes(bnoLong);
		// 좋아요 테이블에 데이터가 있는지 확인
		BoardIsLikedDto isLiked = boardMapper.selectBIsLiked(new BoardIsLikedDto(bnoLong, mnoLong));
		
		// 데이터가 있으면 isLiked 값을 변화시킴
		if (isLiked != null) {
			return new LikesVO(likes-1, likes, 1L);
		}else {
			return new LikesVO(likes, likes, 0L);
		}
	}
	
	@Transactional
	@Override
	public LikesVO modifyGetBoardLikes(String bno, String mno) {
		try {
			
		long bnoLong = Long.valueOf(bno);
		long mnoLong = Long.valueOf(mno);

		BoardIsLikedDto boardIsLiked = new BoardIsLikedDto(bnoLong, mnoLong);
		
		long beforelikes = boardMapper.selectBoardLikes(bnoLong);
		
		BoardIsLikedDto isLiked = boardMapper.selectBIsLiked(boardIsLiked);
		
		
		// 비어있는 상태가 아니라면
		if (isLiked != null) {
			boardMapper.updateBLikeDown(bnoLong);
			boardMapper.deleteBLiked(isLiked);
		} else {			
			boardMapper.updateBLikeUp(bnoLong);
			boardMapper.insertBLiked(boardIsLiked);
		}
		

		long afterlikes = boardMapper.selectBoardLikes(bnoLong);
		
		LikesVO likes = new LikesVO(beforelikes, afterlikes, (afterlikes - beforelikes));
		return likes;
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}

	// 게시글 카테고리 가져오기
	@Override
	public List<BoardCategoryDto> showBoardCategorys() {
		return boardMapper.selectBoardCategorys();
	}

	@Override
	public BoardCategoryDto showBoardCategory(String categoryName) {
		return boardMapper.selectBoardCategory(categoryName);
	}

	@Override
	public BoardCategoryDto showBoardCategory(long categoryNo) {
		return boardMapper.selectBC(categoryNo);
	}
}
