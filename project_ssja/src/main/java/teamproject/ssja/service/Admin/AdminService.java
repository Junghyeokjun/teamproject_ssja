package teamproject.ssja.service.Admin;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardForm;
import teamproject.ssja.mapper.NoticeBoardMapper;
import teamproject.ssja.page.ListObjectPagingDTO;

@Service
@RequiredArgsConstructor
public class AdminService {

	private final NoticeBoardMapper noticeMapper;
	
	public ListObjectPagingDTO getNoticeListP(BoardForm form) {
		List<BoardDto> list = noticeMapper.getNoticeList(form);
		if(list.size() == 0) {
			return null;
		}
		ListObjectPagingDTO data = 
				new ListObjectPagingDTO(list.get(0).getTotal(), form.getPageNum());
		data.setObjectList(list);
		return data;
	}
	public void deleteNoticeContent(Long boardNum) {
		noticeMapper.deleteNoticeContent(boardNum);
		
	}
	
	public void addNotice(BoardDto form) {
		noticeMapper.addNotice(form);
	}
	public BoardDto getCurrentNotice(Long boardNum) {
		return noticeMapper.getCurrentNotice(boardNum);
	}
	public void renewNotice(BoardDto data) {
		noticeMapper.renewNotice(data);
	}
}
