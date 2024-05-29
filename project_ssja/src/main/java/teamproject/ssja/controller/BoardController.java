package teamproject.ssja.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Board.BoardService;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@GetMapping("/list/{category}")
	public String boardList(Model model, Criteria criteria,@PathVariable("category") long bcno) {
		log.info("boardList()..");
		model.addAttribute("bc", boardService.showBoardCategory(bcno));
		criteria.setBcno(bcno);
		// 해당 함수도 임시로 숫자를 부여하여 처리한 상태.
		// 수정 필요
		model.addAttribute("boards",  boardService.showListWithPaging(criteria));
		
		// 임시로 카테고리 숫자 넣음
		model.addAttribute("pageMaker", new PageVO(boardService.getTotal(criteria.getBcno()), criteria));
		return "/qna/qna_list";
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
		return "/qna/content_view";
	}

	@GetMapping("/write_view/{category}")
	public String writeView(Model model, @PathVariable("category") long bcno) {
		log.info("writeView()..");
		model.addAttribute("bcno", bcno);
		return "/qna/write_view";
	}

	@PostMapping("/write")
	public String addOne(BoardDto boardDto) {
		log.info("addOne()..");
		boardService.addBoard(boardDto);
		return "redirect:/board/list";
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
		return "redirect:/board/list";
	}

	@GetMapping("/delete")
	@PostMapping("/delete")
	public String removeOne(BoardDto boardDto) {
		log.info("removeOne()..");
		boardService.removeBoard(boardDto);
		return "redirect:/board/list";
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
