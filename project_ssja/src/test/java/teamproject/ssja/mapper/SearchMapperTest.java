package teamproject.ssja.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import teamproject.ssja.dto.product.SearchForm;

@SpringBootTest
class SearchMapperTest {

	@Autowired
	SearchMapper searchMapper;
	
	@Test
	void test() {
		SearchForm form = new SearchForm("123", 1, 2, 3,"");
		searchMapper.searchItemList(form);
		
	}

}
