package teamproject.ssja.service.Community;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardImgsDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.mapper.BoardMapper;
import teamproject.ssja.mapper.ReplyMapper;

@Slf4j
@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	ReplyMapper replyMapper;

	//배포시에 경로에 따라 수정
	final String absolutePath="C:/Users/601-5/git/temaproject_ssja/project_ssja/src/main/resources/static/images/board_content";
	final String path = "/images/board_content";
	
	@Override
	public List<CommunityBoardDto> getPost(int pageNum, int amount) {
		return boardMapper.selectCommunityDto(pageNum, amount);
	}

	
	@Override
	public List<CommunityBoardDto> getBestPost() {
		return boardMapper.selectBestCommunityDto();
	}

	@Override
	public long getCommunityTotal() {
		
		return boardMapper.selectTotalCount(40);
	}

	@Override
	public CommunityBoardDto getContent(long bno) {
		return boardMapper.selectCommunityContent(bno);
	}

	@Transactional
	@Override
	public long insertPost(BoardDto post) {
		boardMapper.insertBoard(post);
		return post.getBno();
	}
	
	@Transactional
	@Override
	public int deletePost(long bno) {
		BoardDto board= new BoardDto();
		board.setBno(bno);
		replyMapper.deleteAllReply(bno);
//		boardMapper.deleteAllBLiked(bno);
		return boardMapper.deleteBoard(board);
	}
	
	@Override
	public List<ReplysDto> getReply(int replyNum, int amount, long bno) {
		return replyMapper.selectPartReplys(replyNum, amount, bno);
	}

	@Override
	public long getReplyTotal(long bno) {
		return replyMapper.selectReplyCount(bno);
	}

	@Override
	public int insertReply(ReplysDto reply) {
		int replyResult=0;
		if(reply.getRgroup()==0) {
			replyResult= replyMapper.insertReply(reply);
		}else {
			replyMapper.updateShape(reply);
			replyResult=replyMapper.insertReReply(reply);
		}
		
		return replyResult;
	}

	@Override
	public long getBoardLikedTotal(long bno) {
		return boardMapper.selectBoardLikes(bno);
	}

	@Override
	public int insertBoardLiked(BoardIsLikedDto liked) {
		int result = boardMapper.insertBLiked(liked);
		boardMapper.updateBLikeUp(liked.getLikebno());
		return result;
	}

	@Override
	public BoardIsLikedDto getBoardLiked(BoardIsLikedDto liked) {
		return boardMapper.selectBIsLiked(liked);
	}

	@Override
	public int modifyContent(BoardDto content) {
		return boardMapper.updateBoard(content);
	}

	@Override
	public String updateTempBoardImg(long bno, MultipartFile file) {
		String fileName="Temp_"+bno+".png";
		File targetFile=new File(absolutePath+"/"+fileName);
		if(file==null || file.isEmpty()) {
			
			return "null";
		}
		try{
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(targetFile));
        }catch (IOException ioException){
            log.error(ioException.toString(),ioException);
            return "null";
        }
		
		return path+"/"+fileName;
	}

	@Override
	public boolean updateBoardImg(long bno, MultipartFile file) {
		boolean result=false;
		String fileName="board_img_"+bno+".png";
		File targetFile=new File(absolutePath+"/"+fileName);
		File tempFile= new File(absolutePath+"/"+"Temp_"+bno+".png");

		//원래 이미지가 존재하지 않을경우 이미지 삽입 
		if(boardMapper.selectBoardImg(bno)==0) {
			boardMapper.insertBoardImg(new BoardImgsDto(0,bno,path+"/temp.png"));
		}
		//파일이 존재하지 않을경우리턴 
		if(file==null || file.isEmpty()) {			
			return result;
		}

		boardMapper.updateBoardImg(new BoardImgsDto(0, bno, path+"/"+fileName));
		//임시파일 삭제
		if(tempFile.exists()) {
			tempFile.delete();
		}
		
		try{
			FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(targetFile));
            result=true;
        }catch (IOException ioException){
            log.error(ioException.toString(),ioException);
            return false;
        }
		
		
		return result;
	}

	

	@Override
	public int deleteBoardImg(long bno) {
		boardMapper.updateBoardImg(new BoardImgsDto(0, bno, "/images/board_content/temp.png"));
		return 0;
	}


	@Override
	public boolean deleteTempBoardImg(long randomNum) {
		String fileName="Temp_"+randomNum+".png";
		File file= new File(absolutePath+"/"+fileName);
		if(file.exists()) {
			file.delete();
		}
		return false;
	}







}
