package teamproject.ssja.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.mapper.ProductMapper;

@Slf4j
@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductMapper productMapper;
	
	@Override
	public List<ProductDto> getList(){
		log.info("getList..");
		
		return productMapper.getList();
	}

	@Override
	public ProductDto get(long PRO_NO) {
		log.info("read..");
		return productMapper.read(PRO_NO);
	}
	
}

