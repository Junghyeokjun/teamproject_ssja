package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.page.Criteria;

@Mapper
public interface NoticeBoardMapper {

	BoardDto read(long bno);
	
	long selectTotalCount();
	List<BoardDto> selectListWithPaging(Criteria criteria);
	
} 
