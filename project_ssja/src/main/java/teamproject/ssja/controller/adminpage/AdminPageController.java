package teamproject.ssja.controller.adminpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;

@Slf4j
@Controller
@RequestMapping("/adminPage")
public class AdminPageController {

	@Autowired
	private MemberListService memberListService;

	@Autowired
	private ProductListService productListService;
	
	@RequestMapping("/membersList")
	public String membersList(Model model, Criteria criteria) {
		log.info("membersList()..");

		long Memberstotal = memberListService.getMemberListTotalCount();
		model.addAttribute("memberpageMaker", new Page10VO(Memberstotal, criteria));
		model.addAttribute("members", memberListService.getMemberListWithPaging(criteria));

		return "/adminPage/membersList";
	}
	
//	@RequestMapping("/membersSearchList")
//	public String membersSearchList(@RequestParam(value = "type", required = false) String type, 
//	                          @RequestParam(value = "keyword", required = false) String keyword, 
//	                          Model model, 
//	                          Criteria criteria) {
//	    log.info("membersSearchList().. Type: {}, Keyword: {}", type, keyword);
//	    
//	    // 검색 조건이 있을 경우 검색 조건을 기반으로 총 회원 수와 회원 목록을 가져옴
//	    long memberTotal;
//	    List<MembersSearchDto> members;
//	    
//	    if (type != null && keyword != null && !type.isEmpty() && !keyword.isEmpty()) {
//	        members = memberListService.getMemberSearchList(type, keyword);
//	        memberTotal = members.size();
//	    } 
//	    else {
//	    	return "/adminPage/membersSearchList";
////	        // 검색 조건이 없을 경우 전체 회원 목록을 가져옴
////	        memberTotal = memberListService.getMemberListTotalCount();
////	        members = memberListService.getMemberListWithPaging(criteria);
//	    }
//	    
//	    model.addAttribute("memberpageMaker", new Page10VO(memberTotal, criteria));
//	    model.addAttribute("members", members);
//	    
//	    return "/adminPage/membersSearchList";
//	}
	
	@GetMapping("/membersSearchList")
	public String membersSearchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword,Model model) {
		log.info("membersSearchList()..");
		model.addAttribute("members", memberListService.getMemberSearchList(type,keyword));

		return "/adminPage/membersSearchList";
	}
	
//	@GetMapping("/membersSearchList")
//    @ResponseBody
//    public List<MembersSearchDto> membersSearchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword) {
//        log.info("membersSearchList()..");
//        return memberListService.getMemberSearchList(type, keyword);
//    }

//	@RequestMapping("/productsList")
//	public String productsList(Model model, Criteria criteria) {
//		log.info("productsList()..");
//
//		long Productstotal = productListService.getProductListTotalCount();
//		model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
//		model.addAttribute("products", productListService.getProductListWithPaging(criteria));
//
//		return "/adminPage/productsList";
//	}
	
}
