package teamproject.ssja.controller.adminpage;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.FillPatternType;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.IndexedColors;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
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
import teamproject.ssja.dto.ProfitDto;
import teamproject.ssja.page.ListObjectPagingDTO;
import teamproject.ssja.service.Admin.AdminService;
import teamproject.ssja.service.Admin.SalesListService;

@Controller
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/adminPage")
public class AdminExpansionController {

	private final SalesListService salesService;
	private final AdminService adminService;
	
	  @GetMapping("/download/profit")//연, 월, 일 매출 통계
	    public void getProfitExcel(HttpServletResponse response) throws IOException {
	        Workbook workbook = null;
	        ServletOutputStream servletOutputStream = null;

	        try {
	            workbook = new XSSFWorkbook();
	            Sheet sheet = workbook.createSheet("매출");

	            // 기본 열 너비 설정
	            sheet.setDefaultColumnWidth(20);

	            // 헤더 스타일 설정
	            CellStyle headerCellStyle = workbook.createCellStyle();
	            headerCellStyle.setFillForegroundColor(IndexedColors.CORAL.getIndex());
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

	            // 첫 번째 행에 헤더 작성
	            Row headerRow1 = sheet.createRow(0);
	            headerRow1.createCell(0).setCellValue("일");
	            headerRow1.createCell(2).setCellValue("월");
	            headerRow1.createCell(4).setCellValue("연");

	            for (int i = 0; i < 6; i++) {
	                if (headerRow1.getCell(i) == null) {
	                    headerRow1.createCell(i);
	                }
	                headerRow1.getCell(i).setCellStyle(headerCellStyle);
	            }

	            // 첫 번째 행 셀 병합
	            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 1));
	            sheet.addMergedRegion(new CellRangeAddress(0, 0, 2, 3));
	            sheet.addMergedRegion(new CellRangeAddress(0, 0, 4, 5));

	            // 데이터 가져오기
	            Map<String, List<ProfitDto>> result = salesService.totalProfit();
	            List<ProfitDto> dailyData = result.get("daily");
	            List<ProfitDto> monthlyData = result.get("monthly");
	            List<ProfitDto> yearlyData = result.get("yearly");

	            // 최대 크기 계산
	            int maxSize = Math.max(dailyData.size(), Math.max(monthlyData.size(), yearlyData.size()));

	            // 데이터 추가
	            int rowCount = 1;

	            for (int i = 0; i < maxSize; i++) {
	                Row row = sheet.createRow(rowCount++);

	                // 일 매출
	                if (i < dailyData.size()) {
	                    ProfitDto daily = dailyData.get(i);
	                    Cell cell1 = row.createCell(0);
	                    Cell cell2 = row.createCell(1);
	                    cell1.setCellValue(daily.getP_DATE());
	                    cell2.setCellValue(daily.getP_PRICE());
	                    cell1.setCellStyle(bodyCellStyle);
	                    cell2.setCellStyle(bodyCellStyle);
	                } else {
	                    row.createCell(0).setCellStyle(bodyCellStyle);
	                    row.createCell(1).setCellStyle(bodyCellStyle);
	                }

	                // 월 매출
	                if (i < monthlyData.size()) {
	                    ProfitDto monthly = monthlyData.get(i);
	                    Cell cell3 = row.createCell(2);
	                    Cell cell4 = row.createCell(3);
	                    cell3.setCellValue(monthly.getP_DATE());
	                    cell4.setCellValue(monthly.getP_PRICE());
	                    cell3.setCellStyle(bodyCellStyle);
	                    cell4.setCellStyle(bodyCellStyle);
	                } 

	                // 연 매출
	                if (i < yearlyData.size()) {
	                    ProfitDto yearly = yearlyData.get(i);
	                    Cell cell5 = row.createCell(4);
	                    Cell cell6 = row.createCell(5);
	                    cell5.setCellValue(yearly.getP_DATE());
	                    cell6.setCellValue(yearly.getP_PRICE());
	                    cell5.setCellStyle(bodyCellStyle);
	                    cell6.setCellStyle(bodyCellStyle);
	                }
	            }
	            /**
	             * download
	             */
	            String fileName = "total_profit";//파일 이름 한글일 경우 깨짐

	            response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	            response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");
	            servletOutputStream = response.getOutputStream();

	            workbook.write(servletOutputStream);
	        } catch (IOException e) {
	        	
	            throw e;
	            
	        } finally {
	        	
	            if (workbook != null) {
	                workbook.close();
	            }
	            if (servletOutputStream != null) {
	                servletOutputStream.close();
	            }
	        }
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
