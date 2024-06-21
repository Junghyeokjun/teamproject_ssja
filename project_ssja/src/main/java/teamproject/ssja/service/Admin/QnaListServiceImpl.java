package teamproject.ssja.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class QnaListServiceImpl implements  QnaListService{
	
	@Autowired
	private AdminPageMapper adminPageMapper;
	
	@Override
	public long getQnaListTotalCount() {
		log.info("getQnaListTotalCount()..");
		return adminPageMapper.getQnaListTotalCount();
	}
	
	@Override
	public List<QnaBoardDto> getQnaListWithPaging(Criteria cri){
		log.info("getMemberListWithPaging()..");
		return adminPageMapper.getQnaListWithPaging(cri);
	}
	//검색리스트
//	List<BoardSearchDto> getQnaSearchList(String type, String keyword);

}
