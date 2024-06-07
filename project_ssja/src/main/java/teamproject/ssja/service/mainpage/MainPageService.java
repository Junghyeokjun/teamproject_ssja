package teamproject.ssja.service.mainpage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import teamproject.ssja.dto.mainpage.MainPageDTO;
import teamproject.ssja.mapper.EventMapper;
import teamproject.ssja.mapper.ProductListMapper;

@Service
public class MainPageService {


	@Autowired
	private  ProductListMapper productListMapper;
	
	@Autowired
	private EventMapper eventMapper;
	
	public MainPageDTO getMainPageData(int bestPageNum){
		
				MainPageDTO data = new MainPageDTO(eventMapper.getEventList(),
										productListMapper.bestItemsList(bestPageNum));
				return	data;
		
	}
	
}
