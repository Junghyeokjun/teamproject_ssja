package teamproject.ssja.controller.adminpage;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.OrderDetailsDto;
import teamproject.ssja.dto.OrdersSearchDto;
import teamproject.ssja.dto.ProductReviewsDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ProductReviewReplyDto;
import teamproject.ssja.dto.ProductsSearchDto;
import teamproject.ssja.dto.QnaBoardDto;
import teamproject.ssja.dto.QnaSearchDto;
import teamproject.ssja.dto.VendorDetailsDto;
import teamproject.ssja.dto.userinfo.CouponDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.service.Admin.AdminInfoListService;
import teamproject.ssja.service.Admin.CouponListService;
import teamproject.ssja.service.Admin.MemberListService;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Admin.OrdersListService;
import teamproject.ssja.service.Admin.QnaListService;
import teamproject.ssja.service.Admin.SalesListService;
import teamproject.ssja.service.Product.ProductCategoryService;
import teamproject.ssja.service.Vendor.VendorService;

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
	private OrdersListService ordersListService;

	@Autowired
	private CouponListService couponListService;

	@Autowired
	private SalesListService salesListService;

	@Autowired
	private QnaListService qnaListService;

	@Autowired
	ProductCategoryService productCategoryService;

	@Autowired
	VendorService vendorService;

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

	@GetMapping("/dailyPurList")

	@ResponseBody
	public List<OrderDetailsDto> getDailyPurList() {
		return adminInfoListService.getDailyPurList();
	}

	@GetMapping("/dailyMList")
	@ResponseBody
	public List<MembersDto> getDailyMList() {
		return adminInfoListService.getDailyMList();
	}

	@GetMapping("/dailyQnaList")
	@ResponseBody
	public List<QnaBoardDto> getDailyQnaList() {
		return adminInfoListService.getDailyQnaList();
	}
	
	@GetMapping("/vendorsList")
	@ResponseBody
	public List<VendorDetailsDto> getVendorsList() {
		return memberListService.getVendorsList();
	}

	@GetMapping("/membersList")
	public String membersList(Model model, Criteria criteria) {
		//("membersList()..");

		long Memberstotal = memberListService.getMemberListTotalCount();
		model.addAttribute("memberpageMaker", new Page10VO(Memberstotal, criteria));
		model.addAttribute("members", memberListService.getMemberListWithPaging(criteria));
		return "/adminPage/membersList";
	}

	@GetMapping("/membersSearchList")
	public ResponseEntity<List<MembersSearchDto>> membersSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		//("membersSearchList()..");
		List<MembersSearchDto> searchResults = memberListService.getMemberSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}

	@GetMapping("/modifyMember")
	@ResponseBody
	public MembersDto getMember(@RequestParam("M_NO") int M_NO) {
		//("getMember()..");

		return memberListService.getMemberId(M_NO);
	}

	@PostMapping("/modifyMember")
	public String modifyMember(@RequestBody MembersDto membersDto) {
		//("modifyMember()..");
		memberListService.modifyMember(membersDto);
		return "redirect:/adminPage/membersList";
	}

	@PostMapping("/removeMember")
	public String removeMember(@RequestBody MembersDto membersDto) {
		//("removeMember()..");
		memberListService.removeMember(membersDto);
		return "redirect:/adminPage/membersList";
	}

	@RequestMapping("/productsList")
	public String productsList(Model model, Criteria criteria) {
		//("productsList()..");

		long Productstotal = productListService.getProductListTotalCount();
		model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
		model.addAttribute("products", productListService.getProductListWithPaging(criteria));

		return "/adminPage/productsList";
	}

	@GetMapping("/productsSearchList")
	public ResponseEntity<List<ProductsSearchDto>> productsSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		List<ProductsSearchDto> searchResults = productListService.getProductsSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}

	@GetMapping("/modifyProduct")
	@ResponseBody
	public ProductDto getProduct(@RequestParam("PRO_NO") int PRO_NO) {

		return productListService.getProductId(PRO_NO);
	}

	@PostMapping("/modifyProduct")
	public String modifyProduct(@RequestBody ProductDto productDto) {
		productListService.modifyProduct(productDto);
		return "redirect:/adminPage/productsList";
	}

	@PostMapping("/removeProduct")
	public String removeProduct(@RequestBody ProductDto productDto) {
		productListService.removeProduct(productDto);
		return "redirect:/adminPage/productsList";
	}

	@GetMapping("/product/write")
	public String writeProduct(Model model) {
		// 카테고리
		model.addAttribute("pcMains", productCategoryService.getPCMain());

		return "/adminPage/admin_write_product";
	}
	
	@GetMapping("/reviewProductList")
    @ResponseBody
    public List<ProductReviewsDto> getProductReviews(@RequestParam("PRO_NO") int productId) {
        List<ProductReviewsDto> reviews = productListService.getReviewsByProductId(productId);
        return reviews;
    }	
	
	@PostMapping("/removeReviewProduct")
	public String removeReviewProduct(@RequestBody ProductReviewsDto productReviewsDto) {
		productListService.removeReviewProduct(productReviewsDto);
		return "redirect:/adminPage/productsList";
	}
	
	@GetMapping("/replyReviewProductList")
    @ResponseBody
    public List<ProductReviewReplyDto> getProductReviewReplys(@RequestParam("B_NO") int productId) {
        List<ProductReviewReplyDto> replys = productListService.getReplyReviewsByProductId(productId);
        return replys;
    }
	
	@PostMapping("/removeReplyReviewProduct")
	public String removeReplyReviewProduct(@RequestBody ProductReviewReplyDto productReviewReplyDto) {
		productListService.removeReplyReviewProduct(productReviewReplyDto);
		return "redirect:/adminPage/productsList";
	}
	
		// 파일 업로드
	@PostMapping("/product/add")
	public String addOne(MultipartFile bannerFile, List<MultipartFile> coverFile, List<MultipartFile> explainFile,
			ProductDto productDto, Model model) {

		if (bannerFile.isEmpty() || coverFile.isEmpty() || explainFile.isEmpty()) {
			vendorService.isEmpty(bannerFile, coverFile, explainFile, model);
		}
		// 배너 이미지 처리 및 물품 추가
		vendorService.addProduct(productDto, bannerFile);

		// 물품 이미지들 처리 및 추가
		vendorService.addProductImgs(coverFile, explainFile, vendorService.getProNum(productDto));

		return "redirect:/adminPage/productsList";
	}

	@RequestMapping("/ordersList")
	public String ordersList(Model model, Criteria criteria) {

		long Orderstotal = ordersListService.getOrdersListTotalCount();
		model.addAttribute("orderspageMaker", new Page10VO(Orderstotal, criteria));
		model.addAttribute("orders", ordersListService.getOrdersListWithPaging(criteria));

		return "/adminPage/ordersList";
	}

	@GetMapping("/ordersSearchList")
	public ResponseEntity<List<OrdersSearchDto>> ordersSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		List<OrdersSearchDto> searchResults = ordersListService.getOrdersSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}

	@RequestMapping("/couponsList")
	public String couponsList(Model model, Criteria criteria) {

		long Couponstotal = couponListService.getCouponListTotalCount();
		model.addAttribute("couponpageMaker", new Page10VO(Couponstotal, criteria));
		model.addAttribute("coupons", couponListService.getCouponListWithPaging(criteria));

		return "/adminPage/couponsList";
	}

	@PostMapping("/writeCoupon")
	public String addCoupon(CouponDTO couponDto) {
		couponListService.addCoupon(couponDto);
		return "redirect:/adminPage/couponsList";
	}

	@GetMapping("/modifyCoupon")
	@ResponseBody
	public CouponDTO getCoupon(@RequestParam("c_no") int c_no) {
		//("getCoupon()..");

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
		//("removeCoupon()..");
		couponListService.removeCoupon(couponDto);
		return "redirect:/adminPage/couponsList";
	}

	@GetMapping("/salesList")
	public String getDailySales(Model model) {
		//("salesList()..");
		List<Map<String, Object>> weeklySales = salesListService.getWeeklySales();
		model.addAttribute("weeklySales", weeklySales);
		List<Map<String, Object>> monthlySales = salesListService.getMonthlySales();
		model.addAttribute("monthlySales", monthlySales);
		List<Map<String, Object>> yearlySales = salesListService.getYearlySales();
		model.addAttribute("yearlySales", yearlySales);
		return "/adminPage/salesList";
	}

	@GetMapping("/qnasList")
	public String qnasList(Model model, Criteria criteria) {
		//("qnasList()..");

		long Qnastotal = qnaListService.getQnaListTotalCount();
		model.addAttribute("qnapageMaker", new Page10VO(Qnastotal, criteria));
		model.addAttribute("qnas", qnaListService.getQnaListWithPaging(criteria));
		return "/adminPage/qnasList";
	}

	@GetMapping("/qnasSearchList")
	public ResponseEntity<List<QnaSearchDto>> qnasSearchList(@RequestParam("type") String type,
			@RequestParam("keyword") String keyword) {
		//("qnasSearchList()..");
		List<QnaSearchDto> searchResults = qnaListService.getQnaSearchList(type, keyword);
		return ResponseEntity.ok(searchResults);
	}

	@GetMapping("/modifyQna")
	@ResponseBody
	public QnaBoardDto getQna(@RequestParam("B_NO") int B_NO) {
		//("getQna()..");

		return qnaListService.getQnaId(B_NO);
	}

	@PostMapping("/modifyQna")
	public String modifyQna(@RequestBody QnaBoardDto qnaBoardDto) {
		//("modifyQna()..");

		qnaListService.modifyQna(qnaBoardDto); // 서비스 메서드를 호출하여 문의 글 수정 처리

		return "redirect:/adminPage/qnasList"; // 수정 후 목록 페이지로 리다이렉트
	}

	@PostMapping("/removeQna")
	public String removeQna(@RequestBody QnaBoardDto qnaBoardDto) {
		//("removeQna()..");
		qnaListService.removeQna(qnaBoardDto);
		return "redirect:/adminPage/qnasList";
	}

}
