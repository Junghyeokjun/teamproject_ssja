package teamproject.ssja.service.Product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.dto.ProductDetailReplyDto;
import teamproject.ssja.mapper.ProductDetailMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class ProductDetailServiceImpl implements ProductDetailService {

	@Autowired
	private ProductDetailMapper productDetailMapper;

	@Override
	public ProductDetailDto get(long PRO_NO) {
		log.info("read..");
		return productDetailMapper.read(PRO_NO);
	}

	@Override
	public long getTotal(long PRO_NO) {
		log.info("getTotal()..");
		return productDetailMapper.getTotalCount(PRO_NO);
	}

	@Override
	public List<ProductDetailReplyDto> getListWithPaging(Criteria cri) {
		log.info("getListWithPaging()..");
		return productDetailMapper.getListWithPaging(cri);
	}

}
