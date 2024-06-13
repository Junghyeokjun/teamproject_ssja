package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardForm;
import teamproject.ssja.page.Criteria;

@Mapper
public interface NoticeBoardMapper {

	BoardDto read(long bno);
	
	long selectTotalCount();
	List<BoardDto> selectListWithPaging(Criteria criteria);
	
	List<BoardDto> getNoticeList(BoardForm form);
	void deleteNoticeContent(Long boardNum);
	void addNotice(BoardDto form);
	
	BoardDto getCurrentNotice(Long boardNum);
	void renewNotice(BoardDto data);
} 
