package teamproject.ssja.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Service
public interface QnaListService {
	
	long getQnaListTotalCount();
	List<QnaBoardDto> getQnaListWithPaging(Criteria cri);
	//검색리스트
//	List<BoardSearchDto> getQnaSearchList(String type, String keyword);

}
