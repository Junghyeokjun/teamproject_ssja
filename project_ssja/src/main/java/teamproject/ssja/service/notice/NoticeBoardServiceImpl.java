package teamproject.ssja.service.notice;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.NoticeSearchDto;
import teamproject.ssja.mapper.NoticeBoardMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class NoticeBoardServiceImpl implements NoticeBoardService {

	@Autowired
	NoticeBoardMapper noticeBoardMapper;
	
	@Override
	public BoardDto showContent(HttpServletRequest request, HttpServletResponse response) {
		long bno = Long.valueOf(request.getParameter("bno"));
		return noticeBoardMapper.read(bno);
	}

	@Override
	public long getTotal() {
		log.info("getTotal()..");
		return noticeBoardMapper.selectTotalCount();
	}

	@Override
	public List<BoardDto> showListWithPaging(Criteria criteria) {
		log.info("showListWithPaging()..");
		return noticeBoardMapper.selectListWithPaging(criteria);
	}

	@Override
	public List<NoticeSearchDto> getNoticeSearchList(String type, String keyword) {
		log.info("getNoticeSearchList()..");
		return noticeBoardMapper.getNoticeSearchList(type,keyword);
	}
}
