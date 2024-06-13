package teamproject.ssja.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.dto.community.CommunityPage;
import teamproject.ssja.service.Community.CommunityService;

@Controller
@RestController
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	CommunityService communityService;
	
	//커뮤니티 루트는 커뮤니티 미리보기 화면
	@GetMapping("")
	public ModelAndView preview(ModelAndView mv) {
		
		mv.setViewName("community/community_preview");
		return mv;
	}
	
	//커뮤니티 게시글 목록화면
	@GetMapping("/main")
	public ModelAndView main(ModelAndView mv) {
//		mv.addObject("pageNum",1);
//		mv.addObject("amount",20);
		mv.setViewName("community/community_main");
		return mv;
	}

	//커뮤니티 게시글 내용화면
	@GetMapping("/content/{bno}")
	public ModelAndView content(ModelAndView mv,@PathVariable("bno") long bno) {
		mv.addObject("content", communityService.getContent(bno));
		mv.addObject("reply_total", communityService.getReplyTotal(bno));
		mv.setViewName("community/community_content");
		return mv;
	}

	//커뮤니티 게시글 입력 화면
	@GetMapping("/content/insert")
	public ModelAndView insert(ModelAndView mv) {
		mv.setViewName("community/community_content_insert");
		return mv;
	}
	//커뮤니티 게시글 내용 수정화면
	@GetMapping("/content/modify")
	public ModelAndView modify(ModelAndView mv,@RequestParam("bno") long bno) {
		System.out.println(1234);
		mv.addObject("content", communityService.getContent(bno));
		mv.addObject("reply_total", communityService.getReplyTotal(bno));
		mv.setViewName("community/community_content_modify");
		return mv;
	}

	//게시글 수정 임시 이미지 수정
	@PostMapping("/content/tempImg/{bno}")
	public String modifyTempImg(@PathVariable("bno") long bno, @RequestParam("image") MultipartFile file) {
		return communityService.updateTempBoardImg(bno, file)+"";
	}
	//게시글 업데이트
	@PostMapping("/content/modify/{bno}")
	public void modifyContent(@PathVariable("bno") long bno, @RequestBody Map<String, Object> data) {
		BoardDto content= new BoardDto();
		
		content.setBno(bno);
		content.setBtitle(data.get("title").toString());
		content.setBcontent(data.get("content").toString());
		
		communityService.modifyContent(content);
		
	}
	
	//게시글 이미지 수정
	@PostMapping("/content/img/{bno}")
	public String modifyImg(@PathVariable("bno") long bno, @RequestParam("image") MultipartFile file) {
		return communityService.updateBoardImg(bno, file)+"";
	}
	
	//게시글 이미지 삭제
	@DeleteMapping("/content/img/{bno}")
	public String deleteImg(@PathVariable("bno") long bno) {
		return communityService.deleteBoardImg(bno)+"";
	}
	
	//댓글 페이징해서 얻어오는 부분
	@GetMapping("/reply")
	public List<ReplysDto> reply(int replyNum,int amount, long bno){
		
		return communityService.getReply(replyNum, amount, bno);
	}
	
	//댓글 삽입하는 부분
	@PostMapping("/reply")
	public int insertReply(@RequestBody Map<String, Object> data){		
		
		System.out.println(data.get("rgroup").toString());
		
		return communityService.insertReply(new ReplysDto(0, Long.valueOf(data.get("rbno").toString()).longValue(), 
															 Long.valueOf(data.get("rmno").toString()).longValue(), 
															 data.get("rwriter").toString(), 
															 data.get("rcontent").toString(), null, 0,  
															 Long.valueOf(data.get("rgroup").toString()).longValue(),  
															 Long.valueOf(data.get("rstep").toString()).longValue(),  
															 Long.valueOf(data.get("rindent").toString()).longValue()));
	}

	//댓글 총개수 얻어오는 부분
	@GetMapping("/replyTotal")
	public long replyTotal(long bno){
		
		return communityService.getReplyTotal(bno);
	}
	
	//게시물의 좋아요 총갯수를를 얻어오는 부분
	@GetMapping("/boradLiked")
	public long boradLiked(long bno) {
		
		return communityService.getBoardLikedTotal(bno);
	}
	//게시물의 좋아요를 추가하는 부분
	@PostMapping("/boradLiked")
	public int insertboradLiked(@RequestBody Map<String, Object> data) {
		
		return communityService.insertBoardLiked(new BoardIsLikedDto(Long.valueOf(data.get("bno").toString()).longValue(),
																	 Long.valueOf(data.get("mno").toString()).longValue()));
	}
	
	//회원이 게시물의 좋아요를 추가한 이력이 있는지 체크하는 부분
	@GetMapping("/boradIsLiked")
	public boolean boradIsLiked(long bno, long mno) {
		
		return communityService.getBoardLiked(new BoardIsLikedDto(bno, mno))!=null;
	}


	//커뮤니티 게시글들을 페이징해서 얻어오는 부분
	@GetMapping("/post")
	public Map<String,Object> post(int pageNum, int amount){
		Map<String, Object> data= new HashMap<String, Object>();
		System.out.println(pageNum);
		CommunityPage page= new CommunityPage(pageNum , communityService.getCommunityTotal());
		data.put("page", page);
		data.put("postList", communityService.getPost(pageNum, amount));

		return data;
	}
	
	//커뮤니티 게시글을 삭제하는 부분
	@PostMapping("/post")
	public long insertPost(@RequestBody Map<String, Object> data){
		System.out.println(data);
		return communityService.insertPost(new BoardDto(0, Long.valueOf(data.get("mno").toString()).longValue(), 
														40, data.get("writer").toString(), 
														data.get("title").toString(), 
														data.get("content").toString(), "SYSDATE", 0, 0, 0, 0, 0));
	}	
	//게시글 입력시 임시 이미지를 삭제하는 메서드
	@DeleteMapping("/tempImg/{randomNum}")
	public boolean deleteTempImg(@PathVariable("randomNum") long randomNum){
		return communityService.deleteTempBoardImg(randomNum);
	}
	
	//커뮤니티 게시글을 삭제하는 부분
	@DeleteMapping("/post")
	public int deletePost(long bno){
		
		return communityService.deletePost(bno);
	}
	//커뮤니티 베스트 게시글들을 얻어오는 부분
	@GetMapping("/bestPost")
	public List<CommunityBoardDto> bestPost(){
		return communityService.getBestPost();

	}
}
