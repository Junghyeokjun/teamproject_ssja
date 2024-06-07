package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.MembersSearchDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.PurchaseDto;
import teamproject.ssja.page.Criteria;

@Mapper
public interface AdminPageMapper {

	long getMemberListTotalCount();

	List<MembersDto> getMemberListWithPaging(Criteria criteria);
	//검색
	List<MembersSearchDto> getMemberSearchList(String type, String keyword);
	
	long getProductListTotalCount();

	List<ProductDto> getProductListWithPaging(Criteria criteria);

	long getPerchaseListTotalCount();

	List<PurchaseDto> getPerchaseListWithPaging(Criteria criteria);
	

}
