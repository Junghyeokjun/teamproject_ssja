package teamproject.ssja.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.BoardService;
import teamproject.ssja.service.ReplyService;

@Slf4j
@Controller
@RequestMapping("/qna")
public class BoardController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;
	
	@GetMapping("/list")
	public String qnaList(Model model, Criteria criteria) {
		log.info("qnaList()..");
		model.addAttribute("qnas",  boardService.showListWithPaging(criteria));
		
		long total = boardService.getTotal();
		model.addAttribute("pageMaker", new PageVO(total, criteria));
		return "/qna/qnalist";
	}

//	@GetMapping("/content_view")
//	public String showView(HttpServletRequest request, HttpServletResponse response, Model model) {
//		log.info("showView()..");
//		model.addAttribute("content_view", boardService.showContent(request, response));
//		return "/qna/content_view";
//	}
	
	@GetMapping("/content_view")
	public String showView(HttpServletRequest request, HttpServletResponse response, Model model) {
		log.info("showView()..");
		model.addAttribute("content_view", boardService.showContent(request, response));
		return "/qna/content_view_test";
	}

	@GetMapping("/write_view")
	public String writeView() {
		log.info("writeView()..");
		return "/qna/write_view";
	}

	@PostMapping("/write")
	public String addOne(BoardDto boardDto) {
		log.info("addOne()..");
		boardService.addBoard(boardDto);
		return "redirect:/qna/list";
	}

	@PostMapping("/modify_view")
	public String modifyView(BoardDto boardDto, Model model) {
		log.info("modifyView()..");
		model.addAttribute("modify_view", boardDto);
		return "/qna/modify_view";
	}

	@PostMapping("/modify")
	public String modify(BoardDto boardDto) {
		boardService.modifyBoard(boardDto);
		return "redirect:/qna/list";
	}

	@GetMapping("/delete")
	@PostMapping("/delete")
	public String removeOne(BoardDto boardDto) {
		log.info("removeOne()..");
		boardService.removeBoard(boardDto);
		return "redirect:/qna/list";
	}

//	@GetMapping("/reply_view")
//	public String replyView(BoardDto boardDto, Model model) {
//		log.info("replyView()..");
//		model.addAttribute("reply_view", boardService.showReply(boardDto));
//		return "/qna/reply_view";
//	}
//	
//	@PostMapping("/reply")
//	public String reply(BoardDto boardDto) {
//		log.info("reply()..");
//		boardService.writeReply(boardDto);
//		return "redirect:/qna/list";
//	}
}
