package teamproject.ssja.service.Reply;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.management.RuntimeErrorException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.InfoProvider;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.LikesVO;
import teamproject.ssja.dto.ReplyIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.dto.userinfo.ReviewForm;
import teamproject.ssja.mapper.BoardMapper;
import teamproject.ssja.mapper.ReplyMapper;
import teamproject.ssja.page.Criteria;

@Slf4j
@Service
public class ReplyServiceImpl implements ReplyService {

	
	@Autowired
	ReplyMapper replyMapper;

	@Override
	public List<ReplysDto> showReplys(long bno) {
		return replyMapper.selectReplys(bno);
	}

	@Override
	public int addReply(ReplysDto replysDto) {
		replyMapper.updateShape(replysDto);
		return replyMapper.insertReply(replysDto);
	}

	@Override
	public int modifyReply(ReplysDto replysDto) {
		return replyMapper.updateReply(replysDto);
	}

	@Override
	public int removeReply(ReplysDto replysDto) {
		return replyMapper.deleteReply(replysDto);
	}

	@Override
	@Transactional
	public LikesVO modifyGetReplyLikes(String rno, String rmo) {
		long noLong = Long.valueOf(rno);
		long moLong = Long.valueOf(rmo);

		ReplyIsLikedDto replyIsLikedDto = new ReplyIsLikedDto(noLong, moLong);
		
		long beforeLikes = replyMapper.selectReplyLikes(noLong);
		
		ReplyIsLikedDto isLiked = replyMapper.selectRIsLiked(replyIsLikedDto);
		
		if (isLiked != null) {
			replyMapper.updateRLikeUp(noLong);
			replyMapper.deleteRLiked(isLiked);
		} else {
			replyMapper.insertRLiked(isLiked);
			replyMapper.updateRLikeDown(noLong);
		}

		long afterLikes = replyMapper.selectReplyLikes(noLong);
		
		LikesVO likes = new LikesVO(beforeLikes, afterLikes, (afterLikes - beforeLikes));
		
		return likes;
	}

	@Override
	public long getTotal(long bno) {
		return replyMapper.selectReplyCount(bno);
	}
	
	@Transactional
	@Override
	public void appleReview(ReviewForm form) {
		try {
			Long id = InfoProvider.getM_NO();
			form.setId(id);
			replyMapper.applyReview(form);
			replyMapper.reviewGiftPoint(form.getId());
			log.info("사진 {}", form.getRv_image());
			
			//리뷰 사진이 있을 경우
		
			if(form.getRv_image() != null  ) {
				
				 String originalFilename = form.getRv_image().getOriginalFilename();
		            String fileExtension = originalFilename.substring(originalFilename.lastIndexOf("."));
		            String fileName = "rv_img_" + form.getProNum() + fileExtension;
//		            String filePath = "./src/main/resources/static/images/review";
		          // 배포 이미지 경로  
		            String filePath = "/home/ubuntu/images/review";

		            // 파일 저장을 위한 디렉토리 생성 및 파일 쓰기
		            Path directory = Paths.get(filePath);
		            Files.createDirectories(directory);
		            Path fileFullPath = directory.resolve(fileName);
		            Files.write(fileFullPath, form.getRv_image().getBytes());
//		            replyMapper.insertReviewImg("/images/review/"+fileName);
		            // 배포 이미지 경로  // 
		            replyMapper.insertReviewImg("/images/review/"+fileName);
		            //("imageinfo {}", fileFullPath.toString());
			}

		} catch (Exception e) {
			
			throw new RuntimeException("리뷰 작성 오류");
		}
	}

}
