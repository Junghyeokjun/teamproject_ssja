package teamproject.ssja.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.dto.ReplysDto;
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

	@GetMapping("/reply")
	public List<ReplysDto> reply(int replyNum,int amount, long bno){
		
		return communityService.getReply(replyNum, amount, bno);
	}
	
	@PostMapping("/reply")
	public String insertReply(@RequestBody Map<String, Object> data){
		System.out.println(data);
		return "aa";
	}
	
	
	//커뮤니티 게시글들을 페이징해서 얻어오는 부분
	@PostMapping("/post")
	public Map<String,Object> post(@RequestBody CommunityPage postPage){
		Map<String, Object> data= new HashMap<String, Object>();

		CommunityPage page= new CommunityPage(postPage.getPageNum(), communityService.getCommunityTotal());
		data.put("page", page);
		data.put("postList", communityService.getPost(postPage.getPageNum(), postPage.getAmount()));

		return data;
	}
}
