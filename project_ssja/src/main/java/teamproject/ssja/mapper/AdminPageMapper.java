package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.page.Criteria;

@Mapper
public interface AdminPageMapper {

	long getMemberListTotalCount();

	List<MembersDto> getMemberListWithPaging(Criteria criteria);
	
	long getProductListTotalCount();

	List<ProductDto> getProductListWithPaging(Criteria criteria);
	
	

}
