package teamproject.ssja.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.vendor.VendorProfitDTO;
import teamproject.ssja.page.Criteria;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.page.PageVO;
import teamproject.ssja.service.Admin.ProductListService;
import teamproject.ssja.service.Board.BoardService;
import teamproject.ssja.service.Product.ProductCategoryService;
import teamproject.ssja.service.Product.ProductDetailService;
import teamproject.ssja.service.Vendor.VendorService;

@Slf4j
@Controller
@RequestMapping("/vendor")
public class VendorController {

	// vendor, product를 가져오는 service autowired해야 함
	// 상품 카테고리를 가져오는 서비스
	@Autowired
	ProductCategoryService productCategoryService;

	@Autowired
	VendorService vendorService;
	
	@Autowired
	BoardService boardService;
	
	@Autowired
	ProductListService productListService;
	
	@Autowired
	ProductDetailService productDetailService; 
	
	@GetMapping("")	
	public String vendorHome() {
		return "/vendor/vendor_view";
	}
	
	@GetMapping("/product/write")
	public String writeProduct(Model model) {
		log.info("writeProduct()..");
		// 카테고리
		model.addAttribute("pcMains", productCategoryService.getPCMain());

		return "/vendor/vendor_write_product";
	}
		
	// 파일 업로드
	@PostMapping("/product/add")
	public String addOne(MultipartFile bannerFile, 
						 List<MultipartFile> coverFile, 
						 List<MultipartFile> explainFile,
						 ProductDto productDto,
						 Model model) {
		log.info("addOne()..");	
		
//		// 데이터 넘어오는 것은 확인함
//		log.info("bannerFile : {} " , bannerFile);
//		log.info("coverFiles : {} " , coverFile);
//		log.info("explainFiles : {} " , explainFile);
//		
//		log.info("Cover Files:");
//		for (MultipartFile file : coverFile) {
//		    log.info("File Name: " + file.getOriginalFilename());
//		    log.info("Content Type: " + file.getContentType());
//		    log.info("File Size: " + file.getSize());
//		}
//
//		log.info("Explain Files:");
//		for (MultipartFile file : explainFile) {
//		    log.info("File Name: " + file.getOriginalFilename());
//		    log.info("Content Type: " + file.getContentType());
//		    log.info("File Size: " + file.getSize());
//		}
		
		if(bannerFile.isEmpty() || coverFile.isEmpty() || explainFile.isEmpty()) {
			vendorService.isEmpty(bannerFile, coverFile, explainFile, model);
		}		
		
		// 배너 이미지 처리 및 물품 추가
		vendorService.addProduct(productDto, bannerFile);

		// 물품 이미지들 처리 및 추가
		vendorService.addProductImgs(coverFile, explainFile, vendorService.getProNum(productDto));

		// 초기화면으로 돌아가기(해당 페이지는 초기 화면 역할을 하며, 이후 변경할 예정)
		return "/vendor/vendor_view";
	}

	@GetMapping("/product/list/{vno}")
	public String showProductList(@AuthenticationPrincipal CustomPrincipal principal, Model model, Criteria criteria, @PathVariable("vno") long vno) {
		log.info("ProductList()..");
		if(principal != null) {
			criteria.setBmno(principal.getMemberNum());
			// 일시적으로 목록을 불러오기 위해 사용. 판매자 자신의 상품 목록 리스트는 요구 메서드가 다름
			// long Productstotal = productListService.getProductListTotalCount();
			// model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
			// model.addAttribute("products", productListService.getProductListWithPaging(criteria));
			long Productstotal = vendorService.getProductCounts(criteria);
			model.addAttribute("productpageMaker", new Page10VO(Productstotal, criteria));
			model.addAttribute("products", vendorService.getProductList(criteria, vno));
			model.addAttribute("vno", vno);
			return "/vendor/vendor_product_list";
		}else {
			return "/login";
		}
	}

	@GetMapping("/product/modify_view")
	public String ShowThisProduct(@RequestParam("proNo")long proNo, Model model, Criteria criteria) {
		model.addAttribute("pcMains", productCategoryService.getPCMain());
		model.addAttribute("product", productDetailService.get(proNo));
		
		ListObjectPagingDTO reviewData = productDetailService.getItemsReview(proNo, criteria.getPageNum());
		model.addAttribute("reviewData", reviewData);
		
		return "/vendor/vendor_modify_product";
	}
	
	@GetMapping("/question/{category}")
	public String showQnaList(@AuthenticationPrincipal CustomPrincipal principal, Model model, Criteria criteria,@PathVariable("category") long bcno) {
		log.info("showProductList()..");	
		criteria.setBmno(principal.getMemberNum());
		model.addAttribute("bc", boardService.showBoardCategory(bcno));
		criteria.setBcno(bcno);
		// 일시적으로 목록을 불러오기 위해 사용. 판매자 자신의 문의 내역 리스트는 요구 메서드가 다름 
		//model.addAttribute("boards",  boardService.showListWithPaging(criteria));
		model.addAttribute("boards",  vendorService.getQnaLists(criteria, bcno, criteria.getBmno()));
		
		//model.addAttribute("pageMaker", new PageVO(boardService.getTotal(criteria.getBcno()), criteria));
		model.addAttribute("pageMaker", new PageVO(vendorService.getQnaCounts(criteria), criteria));
		
		return "/vendor/vendor_qna_list";
	}
	
	@GetMapping("/question/content_view/{category}")
	public String showView(@PathVariable("category") long bcno,HttpServletRequest request, HttpServletResponse response, Model model) {
		log.info("showView()..");
		model.addAttribute("content_view", boardService.showContent(request, response));
		model.addAttribute("bcNo", bcno);		
		return "/vendor/content_view";
	}

	@GetMapping("/question/write_view/{category}")
	public String writeView(Model model, @PathVariable("category") long bcno) {
		log.info("writeView()..");
		model.addAttribute("bcno", bcno);
		return "/vendor/write_view";
	}

	@PostMapping("/question/write")
	public String addOne(@AuthenticationPrincipal CustomPrincipal principal, BoardDto boardDto) {
		log.info("addOne()..");		
		// 관리자 영역. 추후 수정이 필요하거나, 수정하지 않아도 됨.
		boardService.addBoard(boardDto);
		return "redirect:/vendor/question/" + boardDto.getBbcno();
	}

	@PostMapping("/question/modify_view")
	public String modifyView(@AuthenticationPrincipal CustomPrincipal principal, BoardDto boardDto, Model model) {
		log.info("modifyView()..");
		model.addAttribute("modify_view", boardDto);
		return "/vendor/modify_view";
	}

	@PostMapping("/question/modify")
	public String modify(BoardDto boardDto) {
		boardService.modifyBoard(boardDto);
		return "redirect:/vendor/question/20";
	}

	@GetMapping("/question/delete")
	public String removeOne(BoardDto boardDto) {
		log.info("removeOne()..");
		boardService.removeBoard(boardDto);
		return "redirect:/vendor/question/20" ;
	}
	@GetMapping("/info/{bizname}")
	public String vendorInfo(@PathVariable("bizname") String bizname, Model model) {
		model.addAttribute("vendor", bizname);
		return "/vendor/vendorInfo";
	}

	@GetMapping("/down/statistic")
	public void getStatisticExcel(HttpServletResponse response,@RequestParam Long vno, @RequestParam String condition) {
		Map<String, List<VendorProfitDTO>> data = vendorService.getDataForExcel(vno, condition);

		List<VendorProfitDTO> dailyData = data.get("day");
		List<VendorProfitDTO> monthlyData = data.get("month");
		List<VendorProfitDTO> yearlyData = data.get("year");

		Workbook workbook = null;
		ServletOutputStream servletOutputStream = null;

		try {
			workbook = new XSSFWorkbook();
			Sheet sheet1 = workbook.createSheet("일");
			Sheet sheet2 = workbook.createSheet("월");
			Sheet sheet3 = workbook.createSheet("연");

			// 헤더 스타일 설정
			CellStyle headerCellStyle = workbook.createCellStyle();
			headerCellStyle.setFillForegroundColor(IndexedColors.PALE_BLUE.getIndex());
			headerCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
			headerCellStyle.setAlignment(HorizontalAlignment.CENTER); // 글자 가운데 정렬

			// 헤더 폰트 설정
			Font headerFont = workbook.createFont();
			headerFont.setBold(true);
			headerCellStyle.setFont(headerFont);

			// 본문 스타일 설정
			XSSFCellStyle bodyCellStyle = (XSSFCellStyle) workbook.createCellStyle();
			bodyCellStyle.setBorderLeft(BorderStyle.THIN);
			bodyCellStyle.setBorderRight(BorderStyle.THIN);
			bodyCellStyle.setBorderTop(BorderStyle.THIN);
			bodyCellStyle.setBorderBottom(BorderStyle.THIN);

			//헤더 로우 설정
			Row headerRow1 = sheet1.createRow(0);
			Row headerRow2 = sheet2.createRow(0);
			Row headerRow3 = sheet3.createRow(0);
			headerRowDecorator(headerRow1,  headerCellStyle);
			headerRowDecorator(headerRow2,  headerCellStyle);
			headerRowDecorator(headerRow3,  headerCellStyle);

			  // 데이터 로우 설정
	        createDataRows(sheet1, dailyData, bodyCellStyle);
	        createDataRows(sheet2, monthlyData, bodyCellStyle);
	        createDataRows(sheet3, yearlyData, bodyCellStyle);

	        sheet1.setColumnWidth(1, 30 * 620); 
	        sheet2.setColumnWidth(1, 30 * 620); 
	        sheet3.setColumnWidth(1, 30 * 620); 

			String fileName = "total_profit";//파일 이름 한글일 경우 깨짐

            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
            response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
            servletOutputStream = response.getOutputStream();

            workbook.write(servletOutputStream);

		} catch (Exception e) {

			 throw new RuntimeException("Failed to create Excel file", e);

		} finally {

			try {
				if (workbook != null) {
					workbook.close();
				}
				if (servletOutputStream != null) {
					servletOutputStream.close();
				}
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

	static void headerRowDecorator(Row row, CellStyle style) {
		row.createCell(0).setCellValue("날짜");
		row.createCell(1).setCellValue("이름");
		row.createCell(2).setCellValue("번호");
		row.createCell(3).setCellValue("매출");
		row.createCell(4).setCellValue("수량");
		 for (int i = 0; i < 5; i++) {

			 row.getCell(i).setCellStyle(style);
         }
	}

	static void createDataRows(Sheet sheet, List<VendorProfitDTO> data, CellStyle style) {
	    int rowNum = 1;
	    for (VendorProfitDTO dto : data) {
	        Row row = sheet.createRow(rowNum++);
	        row.createCell(0).setCellValue(dto.getOrder_date());
	        row.createCell(1).setCellValue(dto.getPro_name());
	        row.createCell(2).setCellValue(dto.getPro_no());
	        row.createCell(3).setCellValue(dto.getTotal_sales());
	        row.createCell(4).setCellValue(dto.getQuantity());
	        for (int i = 0; i < 5; i++) {
	            row.getCell(i).setCellStyle(style);
	        }
	    }
	}
}
