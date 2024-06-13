package teamproject.ssja.controller.adminpage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.service.Admin.CouponListService;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Admin.PurchaseListService;

@Slf4j
@Controller
@RequestMapping("/adminPage")
public class AdminPageController {

	@Autowired
	private MemberListService memberListService;

	@Autowired
	private ProductListService productListService;
	
	@Autowired
	private PurchaseListService purchaseListService;
	
	@Autowired
	private CouponListService couponListService;
	
	@GetMapping("/membersList")
	public String membersList(Model model, Criteria criteria) {
		log.info("membersList()..");

		long Memberstotal = memberListService.getMemberListTotalCount();
		model.addAttribute("memberpageMaker", new Page10VO(Memberstotal, criteria));
		model.addAttribute("members",memberListService.getMemberListWithPaging(criteria));
		return  "/adminPage/membersList";
	}
	
	@GetMapping("/membersSearchList")
    public ResponseEntity<List<MembersSearchDto>> membersSearchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword) {
        log.info("membersSearchList()..");
        List<MembersSearchDto> searchResults = memberListService.getMemberSearchList(type, keyword);
        return ResponseEntity.ok(searchResults);
    }
	@RequestMapping("/productsList")
	public String productsList(Model model, Criteria criteria) {
		log.info("productsList()..");

		long Productstotal = productListService.getProductListTotalCount();
		model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
		model.addAttribute("products", productListService.getProductListWithPaging(criteria));
		
		return "/adminPage/productsList";
	}
	
	@GetMapping("/productsSearchList")
	public ResponseEntity<List<ProductsSearchDto>> productsSearchList(@RequestParam("type") String type, @RequestParam("keyword") String keyword) {
		log.info("productsSearchList()..");
        List<ProductsSearchDto> searchResults = productListService.getProductsSearchList(type,keyword);
        return ResponseEntity.ok(searchResults);
	}	
	
	@RequestMapping("/purchasesList")
	public String purchasesList(Model model, Criteria criteria) {
		log.info("purchasesList()..");

		long Purchasestotal = purchaseListService.getPerchaseListTotalCount();
		model.addAttribute("purchasepageMaker", new Page10VO(Purchasestotal, criteria));
		model.addAttribute("purchases", purchaseListService.getPerchaseListWithPaging(criteria));
		
		return "/adminPage/purchasesList";
	}	
	
	@RequestMapping("/couponsList")
	public String couponsList(Model model, Criteria criteria) {
		log.info("couponsList()..");
		
		  long Couponstotal = couponListService.getCouponListTotalCount();
		  model.addAttribute("couponpageMaker", new Page10VO(Couponstotal, criteria)); 
		  model.addAttribute("coupons", couponListService.getCouponListWithPaging(criteria));
		 
		return "/adminPage/couponsList";
	}	
	
	@PostMapping("/write")
	public String addCoupon(CouponDTO couponDto) {
		log.info("addCoupon()..");
		couponListService.addCoupon(couponDto);
		return "redirect:/adminPage/couponsList";
	}

}
