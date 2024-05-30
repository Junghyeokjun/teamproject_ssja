package teamproject.ssja.service.Community;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.mapper.BoardMapper;

@Slf4j
@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	BoardMapper boardMapper;

	@Override
	public List<CommunityBoardDto> getPost(int pageNum, int amount) {
		return boardMapper.selectCommunityDto(pageNum, amount);
	}

	@Override
	public long getCommunityTotal() {
		return boardMapper.selectTotalCount(40);
	}

}
