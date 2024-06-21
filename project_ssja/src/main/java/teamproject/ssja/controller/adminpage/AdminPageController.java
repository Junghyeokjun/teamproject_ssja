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
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.PurchaseSearchDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.service.Admin.CouponListService;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Admin.PurchaseListService;
import teamproject.ssja.service.Admin.SalesListService;

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

	@Autowired
	private SalesListService salesListService;

	@GetMapping("")
	public String AdminPage(Model model) {
		List<Map<String, Object>> dailySales = salesListService.getDailySales();
		model.addAttribute("dailySales", dailySales);
		List<Map<String, Object>> monthlySales = salesListService.getMonthlySales();
		model.addAttribute("monthlySales", monthlySales);
		List<Map<String, Object>> yearlySales = salesListService.getYearlySales();
		model.addAttribute("yearlySales", yearlySales);
	
		model.addAttribute("salesData", salesListService.getSalesDataByDate());

		
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

//	@RequestMapping(value = "/adminPage/allSales", method = RequestMethod.GET)
//	@ResponseBody
//	public Map<String, Object> getAllSales() {
//		Map<String, Object> allSales = new HashMap<>();
//		allSales.put("dailySales", salesListService.getDailySales());
//		allSales.put("monthlySales", salesListService.getMonthlySales());
//		allSales.put("yearlySales", salesListService.getYearlySales());
//		return allSales;
//	}

	/*
	 * @GetMapping("/salesData") public ResponseEntity<Map<String, Object>>
	 * getSalesDataByDate(@RequestParam String date) {
	 * log.info("getSalesDataByDate() - date: {}", date); Map<String, Object>
	 * salesData = salesListService.getSalesDataByDate(date);
	 * 
	 * if (salesData != null) { return new ResponseEntity<>(salesData,
	 * HttpStatus.OK); } else { return new ResponseEntity<>(HttpStatus.NOT_FOUND); }
	 * }
	 */
	
//	 @GetMapping("/salesData") 
//	 public ResponseEntity<Map<String, Object>>  getSalesDataByDate() {
//	 log.info("getSalesDataByDate()..");
//	 
//	 // 날짜를 이용해서 매출 데이터를 가져오는 서비스 호출 
//	 Map<String, Object> salesData = salesListService.getSalesDataByDate();
//	 
//	 if (salesData == null) { // 데이터를 찾지 못한 경우 404 에러 반환 return
//	 ResponseEntity.notFound().build(); }
//	 
//	 // 데이터를 성공적으로 가져온 경우 200 OK와 함께 반환 
//	 return ResponseEntity.ok(salesData); 
//	 }
	

}
