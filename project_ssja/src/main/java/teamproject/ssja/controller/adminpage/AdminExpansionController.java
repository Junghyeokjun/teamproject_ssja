package teamproject.ssja.controller.adminpage;

import java.io.IOException;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFCellStyle;
import org.apache.poi.xssf.usermodel.XSSFColor;
import org.apache.poi.xssf.usermodel.XSSFFont;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardForm;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.service.Admin.AdminService;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/adminPage")
public class AdminExpansionController {

	private final AdminService adminService;
	
	
	@GetMapping("/download/profit/admin")
	public void getProgitExcel(HttpServletResponse response) throws IOException {
			
		
		
	        Workbook workbook = new XSSFWorkbook();
	        Sheet sheet1 = workbook.createSheet("연 매출"); // 엑셀 sheet 이름
	        Sheet sheet2= workbook.createSheet("월 매출"); // 엑셀 sheet 이름
	        Sheet sheet3 = workbook.createSheet("일 매출"); // 엑셀 sheet 이름
	        sheet1.setDefaultColumnWidth(15); // 디폴트 너비 설정
	        sheet2.setDefaultColumnWidth(15); // 디폴트 너비 설정
	        sheet3.setDefaultColumnWidth(15); // 디폴트 너비 설정

	        /**
	         * header font style
	         */
	        XSSFFont headerXSSFFont = (XSSFFont) workbook.createFont();
	        headerXSSFFont.setColor(new XSSFColor(new byte[]{(byte) 255, (byte) 255, (byte) 255}));

	        /**
	         * header cell style
	         */
	        XSSFCellStyle headerXssfCellStyle = (XSSFCellStyle) workbook.createCellStyle();

	        // 테두리 설정
	        headerXssfCellStyle.setBorderLeft(BorderStyle.THIN);
	        headerXssfCellStyle.setBorderRight(BorderStyle.THIN);
	        headerXssfCellStyle.setBorderTop(BorderStyle.THIN);
	        headerXssfCellStyle.setBorderBottom(BorderStyle.THIN);

	        // 배경 설정
	        headerXssfCellStyle.setFillForegroundColor(new XSSFColor(new byte[]{(byte) 34, (byte) 37, (byte) 41}));
	        headerXssfCellStyle.setFillPattern(FillPatternType.SOLID_FOREGROUND);
	        headerXssfCellStyle.setFont(headerXSSFFont);

	        /**
	         * body cell style
	         */
	        XSSFCellStyle bodyXssfCellStyle = (XSSFCellStyle) workbook.createCellStyle();

	        // 테두리 설정
	        bodyXssfCellStyle.setBorderLeft(BorderStyle.THIN);
	        bodyXssfCellStyle.setBorderRight(BorderStyle.THIN);
	        bodyXssfCellStyle.setBorderTop(BorderStyle.THIN);
	        bodyXssfCellStyle.setBorderBottom(BorderStyle.THIN);

	        /**
	         * header data
	         */
	        int rowCount = 0; // 데이터가 저장될 행
	        String headerNames[] = new String[]{"첫번째 헤더", "두번째 헤더", "세번째 헤더"};

	        Row headerRow = null;
	        Cell headerCell = null;

	        headerRow = sheet1.createRow(rowCount++);
	        for(int i=0; i<headerNames.length; i++) {
	            headerCell = headerRow.createCell(i);
	            headerCell.setCellValue(headerNames[i]); // 데이터 추가
	            headerCell.setCellStyle(headerXssfCellStyle); // 스타일 추가
	        }

	        int a = 0;
	        
	        Row headerRow2 = sheet2.createRow(a++);
	        int[] sheet2arr = new int[] {1,2,3,4,5};
	        for(int i = 0 ; i < sheet2arr.length;i++) {
	        	   headerCell = headerRow2.createCell(i);
		            headerCell.setCellValue(sheet2arr[i]); // 데이터 추가
		            headerCell.setCellStyle(headerXssfCellStyle);
	        }
	        
	        
	        /**
	         * body data
	         */
	        String bodyDatass[][] = new String[][]{
	            {"첫번째 행 첫번째 데이터", "첫번째 행 두번째 데이터", "첫번째 행 세번째 데이터"},
	            {"두번째 행 첫번째 데이터", "두번째 행 두번째 데이터", "두번째 행 세번째 데이터"},
	            {"세번째 행 첫번째 데이터", "세번째 행 두번째 데이터", "세번째 행 세번째 데이터"},
	            {"네번째 행 첫번째 데이터", "네번째 행 두번째 데이터", "네번째 행 세번째 데이터"}
	        };

	        Row bodyRow = null;
	        Cell bodyCell = null;

	        for(String[] bodyDatas : bodyDatass) {
	            bodyRow = sheet1.createRow(rowCount++);

	            for(int i=0; i<bodyDatas.length; i++) {
	                bodyCell = bodyRow.createCell(i);
	                bodyCell.setCellValue(bodyDatas[i]); // 데이터 추가
	                bodyCell.setCellStyle(bodyXssfCellStyle); // 스타일 추가
	            }
	        }

	        /**
	         * download
	         */
	        String fileName = "excel_API";//파일 이름 한글일 경우 깨짐

	        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
	        ServletOutputStream servletOutputStream = response.getOutputStream();

	        workbook.write(servletOutputStream);
	        workbook.close();
	        servletOutputStream.flush();
	        servletOutputStream.close();
	}
	

	@GetMapping("/notice")
	public String adminMoticePage() {

		return "/adminPage/noticeMain";
	}

	@ResponseBody
	@GetMapping("/notice/list")
	public ResponseEntity<ListObjectPagingDTO> getNoticeLists(@RequestParam("pageNum") int pageNum,
			@RequestParam("keyword") String keyword) {
		try {
			log.info("pageNum  = {}, keyword = {}", pageNum, keyword);
			BoardForm form = new BoardForm();
			form.setPageNum(pageNum);
			form.setKeyword(keyword);
			ListObjectPagingDTO data = adminService.getNoticeListP(form);
			return ResponseEntity.ok(data);

		} catch (Exception e) {
			return ResponseEntity.badRequest().body(null);
		}

	}

	@ResponseBody
	@DeleteMapping("/notice/list")
	public ResponseEntity<String> deleteNotice(@RequestBody Long boardNum) {
		try {
			log.info("삭제할 공지 번호 {}", boardNum);
			adminService.deleteNoticeContent(boardNum);
			return ResponseEntity.ok("seccess");
		} catch (Exception e) {
			return ResponseEntity.badRequest().body("failed");
		}
	}

	@GetMapping("/notice/form")
	public String noticeFormP() {

		return "/adminPage/noticeForm";
	}

	@PostMapping("/notice/form")
	public String noticeFormP(BoardDto form) {
		adminService.addNotice(form);
		return "redirect:/adminPage/notice";
	}

	@GetMapping("/notice/{boardNum}/renew")
	public String renewNotice(@PathVariable("boardNum") Long boardNum, Model model) {
		BoardDto currentNotice = adminService.getCurrentNotice(boardNum);
		model.addAttribute("currentNotice", currentNotice);
		return "/adminPage/noticeRenew";
	}

	@PostMapping("/notice/{boardNum}/renew")
	public String renewNoticeProcess(@PathVariable("boardNum") Long boardNum, BoardDto data) {
		data.setBno(boardNum);
		adminService.renewNotice(data);
		return "redirect:/adminPage/notice";
	}

}
