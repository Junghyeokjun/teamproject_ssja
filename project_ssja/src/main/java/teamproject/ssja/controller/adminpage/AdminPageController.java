package teamproject.ssja.controller.adminpage;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.PurchaseSearchDto;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.dto.QnaSearchDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.service.Admin.AdminInfoListService;
import teamproject.ssja.service.Admin.CouponListService;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Admin.PurchaseListService;
import teamproject.ssja.service.Admin.QnaListService;
import teamproject.ssja.service.Admin.SalesListService;

import java.text.ParseException;

@Slf4j
@Controller
@RequestMapping("/adminPage")
public class AdminPageController {

	@Autowired
	private AdminInfoListService adminInfoListService;

	@Autowired
	private MemberListService memberListService;

	@Autowired
	private ProductListService productListService;

	@Autowired
	private PurchaseListService purchaseListService;

	@Autowired
	private CouponListService couponListService;

	@Autowired
	private SalesListService salesListService;

	@Autowired
	private QnaListService qnaListService;

	@GetMapping("")
	public String AdminPage(Model model) {

		model.addAttribute("dailyPrice", adminInfoListService.getDailyPrice());
		model.addAttribute("dailyPurcount", adminInfoListService.getDailyPurcount());
		model.addAttribute("dailyMCount", adminInfoListService.getDailyMcount());
		model.addAttribute("dailyQnaCount", adminInfoListService.getDailyQnaCount());
		List<Map<String, Object>> dailySales = salesListService.getDailySales();
		model.addAttribute("dailySales", dailySales);
		List<Map<String, Object>> dailyMCounts = salesListService.dailyMCounts();
		model.addAttribute("dailyMCounts", dailyMCounts);
		List<Map<String, Object>> dailyVCounts = salesListService.dailyVCounts();
		model.addAttribute("dailyVCounts", dailyVCounts);

		return "/adminPage/AdminPage";
	}

	@GetMapping("/membersList")
	public String membersList(Model model, Criteria criteria) {
		log.info("membersList()..");

		long Memberstotal = memberListService.getMemberListTotalCount();
		model.addAttribute("memberpageMaker", new Page10VO(Memberstotal, criteria));
		model.addAttribute("members", memberListService.getMemberListWithPaging(criteria));
		return "/adminPage/membersList";
	}

	@GetMapping("/membersSearchList")
	public ResponseEntity<List<MembersSearchDto>> membersSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		log.info("membersSearchList()..");
		List<MembersSearchDto> searchResults = memberListService.getMemberSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}
	
	
	@PostMapping("/removeMember")
	public String removeMember(@RequestBody MembersDto membersDto) {
		log.info("removeMember()..");
		memberListService.removeMember(membersDto);
		return "redirect:/adminPage/membersList";
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
	public ResponseEntity<List<ProductsSearchDto>> productsSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		log.info("productsSearchList()..");
		List<ProductsSearchDto> searchResults = productListService.getProductsSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}
	
	@GetMapping("/modifyProducts")
	@ResponseBody
	public ProductDto getProducts(@RequestParam("PRO_NO") int PRO_NO) {
		log.info("getProducts()..");

		return productListService.getProductsId(PRO_NO);
	}

	@PostMapping("/modifyProducts")
    public String modifyProducts(@RequestBody ProductDto productDto) {
        log.info("modifyProducts()..");

        productListService.modifyProducts(productDto); 

        return "redirect:/adminPage/productsList"; 
    }	

	@RequestMapping("/purchasesList")
	public String purchasesList(Model model, Criteria criteria) {
		log.info("purchasesList()..");

		long Purchasestotal = purchaseListService.getPerchaseListTotalCount();
		model.addAttribute("purchasepageMaker", new Page10VO(Purchasestotal, criteria));
		model.addAttribute("purchases", purchaseListService.getPerchaseListWithPaging(criteria));

		return "/adminPage/purchasesList";
	}

	@GetMapping("/purchasesSearchList")
	public ResponseEntity<List<PurchaseSearchDto>> purchasesSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		log.info("purchasesSearchList()..");
		List<PurchaseSearchDto> searchResults = purchaseListService.getPurchasesSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}

	@RequestMapping("/couponsList")
	public String couponsList(Model model, Criteria criteria) {
		log.info("couponsList()..");

		long Couponstotal = couponListService.getCouponListTotalCount();
		model.addAttribute("couponpageMaker", new Page10VO(Couponstotal, criteria));
		model.addAttribute("coupons", couponListService.getCouponListWithPaging(criteria));

		return "/adminPage/couponsList";
	}

	@PostMapping("/writeCoupon")
	public String addCoupon(CouponDTO couponDto) {
		log.info("addCoupon()..");
		couponListService.addCoupon(couponDto);
		return "redirect:/adminPage/couponsList";
	}

	@GetMapping("/modifyCoupon")
	@ResponseBody
	public CouponDTO getCoupon(@RequestParam("c_no") int c_no) {
		log.info("getCoupon()..");

		return couponListService.getCouponById(c_no);
	}

	@PostMapping("/modifyCoupon")
	public String modifyCoupon(@RequestParam("c_no") int c_no, @RequestParam("c_startdate") String c_startdateStr,
			@RequestParam("c_duedate") String c_duedateStr, @RequestParam("c_name") String c_name,
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

	@PostMapping("/removeCoupon")
	public String removeCoupon(@RequestBody CouponDTO couponDto) {
		log.info("removeCoupon()..");
		couponListService.removeCoupon(couponDto);
		return "redirect:/adminPage/couponsList";
	}

	@GetMapping("/salesList")
	public String getDailySales(Model model) {
		log.info("salesList()..");
		List<Map<String, Object>> dailySales = salesListService.getDailySales();
		model.addAttribute("dailySales", dailySales);
		List<Map<String, Object>> monthlySales = salesListService.getMonthlySales();
		model.addAttribute("monthlySales", monthlySales);
		List<Map<String, Object>> yearlySales = salesListService.getYearlySales();
		model.addAttribute("yearlySales", yearlySales);
		return "/adminPage/salesList";
	}

	@GetMapping("/qnasList")
	public String qnasList(Model model, Criteria criteria) {
		log.info("qnasList()..");

		long Qnastotal = qnaListService.getQnaListTotalCount();
		model.addAttribute("qnapageMaker", new Page10VO(Qnastotal, criteria));
		model.addAttribute("qnas", qnaListService.getQnaListWithPaging(criteria));
		return "/adminPage/qnasList";
	}

	@GetMapping("/qnasSearchList")
	public ResponseEntity<List<QnaSearchDto>> qnasSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		log.info("qnasSearchList()..");
		List<QnaSearchDto> searchResults = qnaListService.getQnaSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}

	@GetMapping("/modifyQna")
	@ResponseBody
	public QnaBoardDto getQna(@RequestParam("B_NO") int B_NO) {
		log.info("getQna()..");

		return qnaListService.getQnaId(B_NO);
	}

	@PostMapping("/modifyQna")
    public String modifyQna(@RequestBody QnaBoardDto qnaBoardDto) {
        log.info("modifyQna()..");

        qnaListService.modifyQna(qnaBoardDto); // 서비스 메서드를 호출하여 문의 글 수정 처리

        return "redirect:/adminPage/qnasList"; // 수정 후 목록 페이지로 리다이렉트
    }
		
	@PostMapping("/removeQna")
	public String removeQna(@RequestBody QnaBoardDto qnaBoardDto) {
		log.info("removeQna()..");
		qnaListService.removeQna(qnaBoardDto);
		return "redirect:/adminPage/qnasList";
	}

}
