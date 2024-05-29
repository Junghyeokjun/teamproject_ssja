package teamproject.ssja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.service.Board.BoardService;
import teamproject.ssja.service.Reply.ReplyService;

@Slf4j
@RestController
@RequestMapping("/api/likes")
public class LikeController {

	@Autowired
	private BoardService boardService;

	@Autowired
	private ReplyService replyService;
	
	// 글 좋아요 확인
	@RequestMapping(value = "/btoggle/{bno}", method = RequestMethod.GET)
	public ResponseEntity<LikesVO> toggleLikes(@PathVariable Long bno, @RequestParam("bno") String no1,
			@RequestParam("mno") String mno) {
		try {
			LikesVO currentLikes = boardService.getBoardLikes(no1, mno);
			log.info("Current likes: " + currentLikes);
			return ResponseEntity.ok(currentLikes);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 스택 트레이스를 콘솔에 출력
			// 예외 발생 시 기본값 0을 반환
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new LikesVO());
		}
	}

	// 글 좋아요 수정 반영 및 확인
	@RequestMapping(value = "/btoggle/{bno}", method = RequestMethod.POST)
	// public ResponseEntity<Long> toggleLike(@PathVariable Long bno, @RequestBody
	// LikesVO likes) {
	public ResponseEntity<LikesVO> toggleLike(@PathVariable Long bno, @RequestParam("bno") String no1,
			@RequestParam("mno") String mno) {
		try {
			LikesVO currentLikes = boardService.modifyGetBoardLikes(no1, mno);
			log.info("Current likes: " + currentLikes);
			return ResponseEntity.ok(currentLikes);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 스택 트레이스를 콘솔에 출력
			// 예외 발생 시 기본값 0을 반환
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new LikesVO());
		}
	}
	
	// 댓글도 일반 불어오기와 수정 불러오기로 반영시켜야 함
	//
	@PostMapping("/rtoggle/{rno}")
	// public ResponseEntity<Long> toggleLike(@PathVariable Long bno, @RequestBody
	// LikesVO likes) {
	public ResponseEntity<LikesVO> toggleLike2(@PathVariable Long rno, @RequestParam("rno") String rno1,
			@RequestParam("mno") String mno) {
		try {
			LikesVO currentLikes = replyService.modifyGetReplyLikes(rno1, mno);
			log.info("Current likes: " + currentLikes);
			return ResponseEntity.ok(currentLikes);
		} catch (Exception e) {
			e.printStackTrace(); // 예외 스택 트레이스를 콘솔에 출력
			// 예외 발생 시 기본값 0을 반환
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new LikesVO());
		}
	}
}
