package teamproject.ssja.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDetailReplyDto;
import teamproject.ssja.page.Criteria;

@Mapper
public interface ProductDetailMapper {
	
	ProductDetailDto read(long PRO_NO);
	
	List<ProductDetailReplyDto> readReply(long PRO_NO);

	long getTotalCount(long PRO_NO);

	List<ProductDetailReplyDto> getListWithPaging(Criteria cri);

}

