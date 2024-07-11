package teamproject.ssja.service.Admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.dto.QnaSearchDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.mapper.AdminPageMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class QnaListServiceImpl implements  QnaListService{
	
	@Autowired
	private AdminPageMapper adminPageMapper;
	
	@Override
	public long getQnaListTotalCount() {
		//("getQnaListTotalCount()..");
		return adminPageMapper.getQnaListTotalCount();
	}
	
	@Override
	public List<QnaBoardDto> getQnaListWithPaging(Criteria cri){
		//("getMemberListWithPaging()..");
		return adminPageMapper.getQnaListWithPaging(cri);
	}
	
	//검색리스트
	@Override
	public List<QnaSearchDto> getQnaSearchList(String type, String keyword) {
		//("getQnaSearchList()..");
		return adminPageMapper.getQnaSearchList(type,keyword);
	}

	@Override
	public QnaBoardDto getQnaId(int qnaId) {
        return adminPageMapper.readQna(qnaId); 
    }

    @Override
    public void modifyQna(QnaBoardDto qnaBoardDto) {
    	adminPageMapper.updateQna(qnaBoardDto); 
    }
    
    @Override
	public int removeQna(QnaBoardDto qnaBoardDto) {
		//("deleteQna()..");
		return adminPageMapper.deleteQna(qnaBoardDto);
	}
}
