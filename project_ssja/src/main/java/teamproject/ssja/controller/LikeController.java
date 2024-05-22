package teamproject.ssja.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.service.BoardService;

@Slf4j
@RestController
@RequestMapping("/api/likes")
public class LikeController {

    @Autowired
    private BoardService boardService;

    @PostMapping("/toggle/{bno}")
    //public ResponseEntity<Long> toggleLike(@PathVariable Long bno, @RequestBody LikesVO likes) {
	public ResponseEntity<LikesVO> toggleLike(@PathVariable Long bno, @RequestParam("no1") String no1, @RequestParam("no2") String no2) {
        try {
        	LikesVO currentLikes = boardService.modifyGetBoardLikes(no1, no2);            
            log.info("Current likes: " + currentLikes);
            return ResponseEntity.ok(currentLikes);
        } catch (Exception e) {
            e.printStackTrace(); // 예외 스택 트레이스를 콘솔에 출력
            // 예외 발생 시 기본값 0을 반환
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(new LikesVO());
        }
    }
}

