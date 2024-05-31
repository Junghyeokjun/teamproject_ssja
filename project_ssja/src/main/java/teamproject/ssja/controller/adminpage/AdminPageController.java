package teamproject.ssja.controller.adminpage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;

@Slf4j
@Controller
public class AdminPageController {
	
	@Autowired
	private MemberListService memberListService;
	
	@Autowired
	private ProductListService productListService;
		
	@RequestMapping("/AdminPage")
	public String adminPage(Model model, Criteria criteria) {
		log.info("adminPage()..");

		long Memberstotal = memberListService.getMemberListTotalCount();
		model.addAttribute("pageMaker", new PageVO(Memberstotal, criteria));
		model.addAttribute("members",  memberListService.getMemberListWithPaging(criteria));
		
		long Productstotal = productListService.getProductListTotalCount();
		model.addAttribute("pageMaker", new PageVO(Productstotal, criteria));
		model.addAttribute("products",  productListService.getProductListWithPaging(criteria));

		
		return "/AdminPage";	
	}
	
}
