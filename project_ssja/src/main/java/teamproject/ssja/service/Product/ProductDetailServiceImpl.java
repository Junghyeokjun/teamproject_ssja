package teamproject.ssja.service.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDetailDto;
import teamproject.ssja.mapper.ProductDetailMapper;

@Slf4j
@Service
public class ProductDetailServiceImpl implements ProductDetailService{
	
	@Autowired
	private ProductDetailMapper productDetailMapper;

	@Override
	public ProductDetailDto get(long PRO_NO) {
		log.info("read..");
		return productDetailMapper.read(PRO_NO);
	}
	
}

