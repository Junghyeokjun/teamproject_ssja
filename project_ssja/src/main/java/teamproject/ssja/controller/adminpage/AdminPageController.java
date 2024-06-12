package teamproject.ssja.controller.adminpage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
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

	@RequestMapping("/productsList")
	public String productsList(Model model, Criteria criteria) {
		log.info("productsList()..");

		long Productstotal = productListService.getProductListTotalCount();
		model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
		model.addAttribute("products", productListService.getProductListWithPaging(criteria));

		return "/adminPage/productsList";
	}

	
	@GetMapping("/noticeList")
	public String adminNoticePage() {
		
		return "/adminPage/noticeMain";
	}
	
}
