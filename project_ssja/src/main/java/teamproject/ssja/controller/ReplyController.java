package teamproject.ssja.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Reply.ReplyService;

@Slf4j
@RestController
@RequestMapping("/api/replys")
public class ReplyController {

	@Autowired
	private ReplyService replyService;

	//@GetMapping("/list")
	public ResponseEntity<Map<String, Object>> getReplyList(@ModelAttribute Criteria criteria){
		Map<String, Object> responseData = new HashMap<>();
		responseData.put("replys", replyService.showReplys(criteria.getBno()));
		responseData.put("pageMaker", new PageVO(replyService.getTotal(criteria.getBno()), criteria));
		return ResponseEntity.ok().body(responseData);
	}
}
