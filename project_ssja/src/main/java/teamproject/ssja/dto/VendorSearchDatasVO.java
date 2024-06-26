package teamproject.ssja.dto;

import java.util.List;import javax.swing.ListModel;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import teamproject.ssja.page.Page10VO;
import teamproject.ssja.page.PageVO;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class VendorSearchDatasVO {
	
	// QnA 문의 검색 데이터
	List<BoardDto> totalData;
	PageVO pageVO;
	
	// 상품 검색 데이터
	List<ProductDto> totalDataPro;
	Page10VO page10VO;
	
	// QnA 문의 검색을 위한 생성자
	public VendorSearchDatasVO(List<BoardDto> totalData, PageVO pageVO){
		this.totalData = totalData;
		this.pageVO = pageVO;
	}
	
	// 상품 검색을 위한 생성자
	public VendorSearchDatasVO(List<ProductDto> totalDataPro, Page10VO page10VO){
		this.totalDataPro = totalDataPro;
		this.page10VO = page10VO;
	}
}
