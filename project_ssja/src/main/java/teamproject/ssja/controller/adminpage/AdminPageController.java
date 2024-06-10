package teamproject.ssja.controller.adminpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Admin.PurchaseListService;

@Slf4j
@RestController
@RequestMapping("/adminPage")
public class AdminPageController {

	@Autowired
	private MemberListService memberListService;

	@Autowired
	private ProductListService productListService;
	
	@Autowired
	private PurchaseListService purchaseListService;
	
	@RequestMapping("/membersList")
	public ModelAndView membersList(ModelAndView model, Criteria criteria) {
		log.info("membersList()..");

		long Memberstotal = memberListService.getMemberListTotalCount();
		model.addObject("memberpageMaker", new Page10VO(Memberstotal, criteria));
		model.addObject("members",memberListService.getMemberListWithPaging(criteria));
		model.setViewName("/adminPage/membersList");
		return  model;
	}
		
	@GetMapping("/membersSearchList")
	public List<MembersSearchDto> membersSearchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword,Model model) {
		log.info("membersSearchList()..");
		return memberListService.getMemberSearchList(type,keyword);
	}	

	@RequestMapping("/productsList")
	public ModelAndView productsList(ModelAndView model, Criteria criteria) {
		log.info("productsList()..");

		long Productstotal = productListService.getProductListTotalCount();
		model.addObject("productpageMaker", new Page10VO(Productstotal, criteria));
		model.addObject("products", productListService.getProductListWithPaging(criteria));
		model.setViewName("/adminPage/productsList");
		
		return model;
	}
	
	@GetMapping("/productsSearchList")
	public List<ProductsSearchDto> productsSearchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword,Model model) {
		log.info("productsSearchList()..");
		return productListService.getProductsSearchList(type,keyword);
	}	
	
	@RequestMapping("/purchasesList")
	public ModelAndView purchasesList(ModelAndView model, Criteria criteria) {
		log.info("purchasesList()..");

		long Purchasestotal = purchaseListService.getPerchaseListTotalCount();
		model.addObject("purchasepageMaker", new Page10VO(Purchasestotal, criteria));
		model.addObject("purchases", purchaseListService.getPerchaseListWithPaging(criteria));
		model.setViewName("/adminPage/purchasesList");
		
		return model;
	}
	
}
