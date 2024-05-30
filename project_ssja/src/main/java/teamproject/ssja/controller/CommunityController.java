package teamproject.ssja.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import teamproject.ssja.dto.community.CommunityPage;
import teamproject.ssja.page.Criteria;
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
	
	//커뮤니티 루트는 커뮤니티 미리보기 화면
		@GetMapping("/main")
		public ModelAndView main(ModelAndView mv) {
//			mv.addObject("pageNum",1);
//			mv.addObject("amount",20);
			mv.setViewName("community/community_main");
			return mv;
		}
		
		@PostMapping("/post")
		public Map<String,Object> post(@RequestBody Integer pageNum,@RequestBody Integer amount){
			Map<String, Object> data= new HashMap<String, Object>();
			CommunityPage page= new CommunityPage(pageNum, communityService.getCommunityTotal());
			data.put("page", page);
			data.put("postList", communityService.getPost(pageNum, amount));
			return data;
		}
}
