package teamproject.ssja.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;
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
		log.info("noticeList()..");
		model.addAttribute("notics",  noticeBoardService.showListWithPaging(criteria));
		
		long total = noticeBoardService.getTotal();
		model.addAttribute("pageMaker", new PageVO(total, criteria));
		return "/notice";
	}
	
	@GetMapping("/notice_view")
	public String notice_view(HttpServletRequest request, HttpServletResponse response, Model model) {
		log.info("notice_view()..");
		model.addAttribute("notice_view", noticeBoardService.showContent(request, response));
		return "/notice_view";
	}

}
