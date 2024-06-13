package teamproject.ssja.controller.adminpage;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardForm;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.service.Admin.AdminService;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/adminPage")
public class AdminExpansionController {

	private final AdminService adminService;

	@GetMapping("/notice")
	public String adminMoticePage() {

		return "/adminPage/noticeMain";
	}

	@ResponseBody
	@GetMapping("/notice/list")
	public ResponseEntity<ListObjectPagingDTO> getNoticeLists(@RequestParam("pageNum") int pageNum,
			@RequestParam("keyword") String keyword) {
		try {
			log.info("pageNum  = {}, keyword = {}", pageNum, keyword);
			BoardForm form = new BoardForm();
			form.setPageNum(pageNum);
			form.setKeyword(keyword);
			ListObjectPagingDTO data = adminService.getNoticeListP(form);
			return ResponseEntity.ok(data);

		} catch (Exception e) {
			return ResponseEntity.badRequest().body(null);
		}

	}

	@ResponseBody
	@DeleteMapping("/notice/list")
	public ResponseEntity<String> deleteNotice(@RequestBody Long boardNum) {
		try {
			log.info("삭제할 공지 번호 {}", boardNum);
			adminService.deleteNoticeContent(boardNum);
			return ResponseEntity.ok("seccess");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("failed");
		}
	}

	@GetMapping("/notice/form")
	public String noticeFormP() {

		return "/adminPage/noticeForm";
	}

	@PostMapping("/notice/form")
	public String noticeFormP(BoardDto form) {
		adminService.addNotice(form);
		return "redirect:/adminPage/notice";
	}

	@GetMapping("/notice/{boardNum}/renew")
	public String renewNotice(@PathVariable("boardNum") Long boardNum, Model model) {
		BoardDto currentNotice = adminService.getCurrentNotice(boardNum);
		model.addAttribute("currentNotice", currentNotice);
		return "/adminPage/noticeRenew";
	}

	@PostMapping("/notice/{boardNum}/renew")
	public String renewNoticeProcess(@PathVariable("boardNum") Long boardNum, BoardDto data) {
		data.setBno(boardNum);
		adminService.renewNotice(data);
		return "redirect:/adminPage/notice";
	}

}
