package teamproject.ssja.service.Product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.ProductCategoryDto;
import teamproject.ssja.dto.ProductCategoryGroupDto;
import teamproject.ssja.mapper.ProductCategoryMapper;

@Service
public class ProductCategoryServiceImpl implements ProductCategoryService {

	@Autowired
	ProductCategoryMapper productCategoryMapper;
	
	@Override
	public List<ProductCategoryDto> getPCFullName() {		
		return productCategoryMapper.selectPCList();
	}

	@Override
	public List<ProductCategoryGroupDto> getPCMain() {
		return productCategoryMapper.selectPCMainList();
	}

	@Override
	public List<ProductCategoryGroupDto> getPCSub(long mainPCNum) {
		return productCategoryMapper.selectPCSubList(mainPCNum);
	}

	@Override
	public long getMainPCTotal() {		
		return productCategoryMapper.selectPCMainCount();
	}

	@Override
	public long getPCTotal() {
		return productCategoryMapper.selectPCAllCount();
	}

}
