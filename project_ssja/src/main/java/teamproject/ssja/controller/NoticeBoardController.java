package teamproject.ssja.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.NoticeSearchDto;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.notice.NoticeBoardService;

@Slf4j
@Controller
public class NoticeBoardController {

	@Autowired
	private NoticeBoardService noticeBoardService;
	
	@GetMapping("/notice")
	public String noticeList(Model model, Criteria criteria) {
		//("noticeList()..");
		model.addAttribute("notics",  noticeBoardService.showListWithPaging(criteria));
		
		long total = noticeBoardService.getTotal();
		model.addAttribute("pageMaker", new PageVO(total, criteria));
		return "/notice";
	}
	
	@GetMapping("/noticeSearchList")
	public ResponseEntity<List<NoticeSearchDto>> noticeSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		//("noticeSearchList()..");
		List<NoticeSearchDto> searchResults = noticeBoardService.getNoticeSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}
	
	@GetMapping("/notice_view")
	public String notice_view(HttpServletRequest request, HttpServletResponse response, Model model) {
		//("notice_view()..");
		model.addAttribute("notice_view", noticeBoardService.showContent(request, response));
		return "/notice_view";
	}

}
