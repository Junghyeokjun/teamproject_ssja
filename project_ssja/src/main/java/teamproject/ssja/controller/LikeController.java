package teamproject.ssja.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import teamproject.ssja.service.BoardService;

@RestController
@RequestMapping("/api/likes")
public class LikeController {

	@Autowired
    private BoardService boardService;
	
    @Autowired
    public LikeController(BoardService boardService) {
        this.boardService = boardService;
    }

    @PostMapping("/toggle/{bno}")
    public ResponseEntity<Long> toggleLike(@PathVariable Long bno, @RequestParam boolean liked) {
       	long currentLikes = boardService.modifyGetBoardLikes(liked, bno);  // 좋아요 수를 가져오는 메서드
        return ResponseEntity.ok(currentLikes);
    }
}
