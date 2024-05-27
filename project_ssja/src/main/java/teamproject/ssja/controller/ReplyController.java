package teamproject.ssja.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.service.Board.BoardService;
import teamproject.ssja.service.Reply.ReplyService;

@Slf4j
@RestController
@RequestMapping("/api/replys")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	//@GetMapping("/list")
//	public ResponseEntity<Map<String, Object>> getReplyList(@ModelAttribute Criteria criteria ){
//		
//	}
}
