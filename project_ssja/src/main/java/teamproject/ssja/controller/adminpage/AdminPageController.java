package teamproject.ssja.controller.adminpage;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
import java.text.ParseException;


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

	/*
	 * @PostMapping("/modify") public String modifyCoupon(CouponDTO couponDto) {
	 * log.info("modifyCoupon().."); couponListService.modifyCoupon(couponDto);
	 * return "redirect:/adminPage/couponsList"; }
	 */
	

//	@GetMapping("/remove")
//	@PostMapping("/remove")
//	public String removeCoupon(CouponDTO couponDto) {
//		log.info("removeCoupon()..");
//		couponListService.removeCoupon(couponDto);
//		return "redirect:/adminPage/couponsList";
//	}
//	 @GetMapping("/modify")
//	    @ResponseBody
//	    public CouponDTO getCoupon(@RequestParam("c_no") int c_no) {
//	        return couponListService.getCouponById(c_no);
//	    }
//	 
//	  @PostMapping("/modify")
//	    public String modifyCoupon(@ModelAttribute CouponDTO couponDto) {
//		  couponListService.modifyCoupon(couponDto);
//	        return "redirect:/adminPage/couponsList";
//	    }
	  @GetMapping("/modify")
	    @ResponseBody
	    public CouponDTO getCoupon(@RequestParam("c_no") int c_no) {
	        log.info("getCoupon()..");

	        return couponListService.getCouponById(c_no);
	    }
	  @PostMapping("/modify")
	  public String modifyCoupon(@RequestParam("c_no") int c_no,
	                             @RequestParam("c_startdate") String c_startdateStr,
	                             @RequestParam("c_duedate") String c_duedateStr,
	                             @RequestParam("c_name") String c_name,
	                             @RequestParam("c_dcper") int c_dcper) {

	      java.sql.Date c_startdate = null;
	      java.sql.Date c_duedate = null;
	      
	      try {
	          SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	          java.util.Date parsedStartDate = dateFormat.parse(c_startdateStr);
	          java.util.Date parsedDueDate = dateFormat.parse(c_duedateStr);
	          
	          c_startdate = new java.sql.Date(parsedStartDate.getTime());
	          c_duedate = new java.sql.Date(parsedDueDate.getTime());
	      } catch (ParseException e) {
	          e.printStackTrace();
	          // 예외 처리 로직 추가
	      }

	      CouponDTO couponDto = new CouponDTO(c_no, c_startdate, c_duedate, c_name, c_dcper);
	      couponListService.modifyCoupon(couponDto);

	      return "redirect:/adminPage/couponsList";
	  }



	
//	@PostMapping("/modify")
//	public String modifyCoupon(@RequestParam("c_no") int c_no, 
//			@RequestParam("c_startdate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date c_startdate,
//            @RequestParam("c_duedate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date c_duedate,
//	                           @RequestParam("c_name") String c_name,
//	                           @RequestParam("c_dcper") int c_dcper) {
//	    log.info("modifyCoupon()..");
//
//	    // 생성된 CouponDTO 객체로 넘겨주기
//	    CouponDTO couponDto = new CouponDTO(c_no,  c_startdate, c_duedate,c_name, c_dcper);
//	    couponListService.modifyCoupon(couponDto);
//
//	    return "redirect:/adminPage/couponsList";
//	}
//	@PostMapping("/modify")
//	public String modify(BoardDto boardDto) {
//		boardService.modifyBoard(boardDto);
//		return "redirect:/board/list";
//	}

	
	 @PostMapping("/remove")
	    public String removeCoupon(@RequestBody CouponDTO couponDto) {
	        log.info("removeCoupon()..");
	        couponListService.removeCoupon(couponDto);
	        return "redirect:/adminPage/couponsList";
	    }

}
