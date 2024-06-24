package teamproject.ssja.service.aspect;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;
import teamproject.ssja.mapper.AdminPageMapper;

@Service
@RequiredArgsConstructor
public class AspectServiceImpl implements AspectService{

	private final AdminPageMapper adminMapper;
	
	@Override
	public void addVisitCount() {
		adminMapper.addVisitCount();
	}

}
