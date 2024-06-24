package teamproject.ssja.service.Admin;

import java.util.List;

import org.springframework.stereotype.Service;

import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.dto.QnaSearchDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;

@Service
public interface QnaListService {
	
	long getQnaListTotalCount();
	List<QnaBoardDto> getQnaListWithPaging(Criteria cri);
	//검색리스트
	List<QnaSearchDto> getQnaSearchList(String type, String keyword);
	
	QnaBoardDto getQnaId(int b_no);
	void modifyQna(QnaBoardDto qnaBoardDto);
	
	int removeQna(QnaBoardDto qnaBoardDto);

}
