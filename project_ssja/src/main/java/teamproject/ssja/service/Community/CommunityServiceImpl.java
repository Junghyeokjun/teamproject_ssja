package teamproject.ssja.service.Community;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Random;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.FileCopyUtils;
import org.springframework.util.MultiValueMap;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.slf4j.Slf4j;
import teamproject.ssja.dto.BoardDto;
import teamproject.ssja.dto.BoardImgsDto;
import teamproject.ssja.dto.BoardIsLikedDto;
import teamproject.ssja.dto.MembersDto;
import teamproject.ssja.dto.ProductDto;
import teamproject.ssja.dto.ReplysDto;
import teamproject.ssja.dto.community.CommunityBoardDto;
import teamproject.ssja.dto.login.CustomPrincipal;
import teamproject.ssja.mapper.BoardMapper;
import teamproject.ssja.mapper.MembersMapper;
import teamproject.ssja.mapper.ProductCategoryMapper;
import teamproject.ssja.mapper.ProductDetailMapper;
import teamproject.ssja.mapper.ProductListMapper;
import teamproject.ssja.mapper.ReplyMapper;

@Slf4j
@Service
public class CommunityServiceImpl implements CommunityService {

	@Autowired
	BoardMapper boardMapper;
	
	@Autowired
	ReplyMapper replyMapper;

	@Autowired
	ProductDetailMapper productMapper;
	
	@Autowired
	ProductListMapper productSearchMapper;
	
	@Autowired
	MembersMapper membersMapper;
	
	@Autowired
	ProductCategoryMapper categoryMapper;
	
	//배포시에 경로에 따라 수정
//	final String absolutePath="/home/ubuntu/images";
    final String absolutePath="\\\\DESKTOP-RDUHP84\\board_content";
    final String path = "/images/board_content";
	
	@Override
	public List<CommunityBoardDto> getPost(int pageNum, int amount) {
		return boardMapper.selectCommunityDto(pageNum, amount);
	}

	@Override
	public List<CommunityBoardDto> getSearchPost(int pageNum, int amount, String option, String keyword) {
		return boardMapper.selectSearchCommunityDto(pageNum, amount, option, keyword);
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
	public long getCommunitySearchTotal(String option, String keyword) {
		return boardMapper.selectSearchTotalCount(40, option, keyword);
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
	public String updateTempBoardImg(List<String> allList,List<String> realList,long bno) {
		File targetFile=null;
		boolean banner=true;
		
		if(boardMapper.selectBoardImg(bno)==0) {
			boardMapper.insertBoardImg(new BoardImgsDto(0,bno,path+"/temp.png"));
		}
		
		for (String filePath : allList) {
			if(realList.contains(filePath)) {
				if(banner) {
					boardMapper.updateBoardImg(new BoardImgsDto(0, bno, filePath));
					banner=false;
				}
			}else {
				targetFile=new File(filePath.replace(path, absolutePath));
				if(targetFile.exists()) {
					targetFile.delete();
				}
			}
		}
		if(realList.get(0).equals("temp")) {
			boardMapper.updateBoardImg(new BoardImgsDto(0, bno, path+"/temp.png"));
			return "temp";
		}
		
		return "imgae";
	}




	@Override
	public boolean deleteTempBoardImg(List<String> fileNames) {
		File file=null;
		for (String fileName : fileNames) {
			fileName=fileName.replace(path, absolutePath);
			file=new File(fileName);
			if(file.exists()) {
				file.delete();
			}
		}
		return true;
	}


	@Override
	public int deleteReply(long rno) {
		ReplysDto reply=replyMapper.selectReply(rno);
		int result=0;
		if(replyMapper.selectReReplyCount(reply)==0) {
			result=replyMapper.deleteReply(reply);		
			replyMapper.updateRShape(reply);
		}else {
			reply.setRcontent("삭제된 댓글입니다.");
			reply.setRmno(0);
			reply.setRmnickname(" ");
			replyMapper.updateDeleteReply(reply);
		}
		return result;
	}


	@Override
	public int updateReply(ReplysDto reply) {
		return replyMapper.updateReply(reply);
	}

	@Override
	public int updateHit(CustomPrincipal principal,long bno) {
	    if (principal != null) {
	    	Set<Long> hitSet= null;
	    	try {
	    		hitSet=principal.getUserInfo().getHit();
			} catch (Exception e) {
				return 0;
			}
	    	
	    	if(!hitSet.contains(bno)) {
	    		hitSet.add(bno);
	    		return boardMapper.updateHit(bno);
	    	}
	    }		
	    return 0;
	}

	@Override
	public List<ProductDto> getProducts(String keyword) {
		if(keyword==null) {
			return productSearchMapper.getProducts("%%");
		}
		
		return productSearchMapper.getProducts("%"+keyword+"%");
	}

	@Override
	public int updateBoardProduct(long bno, long proNo) {		
		int result=0;
		
		if(proNo==0) {
			result=boardMapper.deleteBoardProduct(bno);
		}else {
			result=boardMapper.updateBoardProduct(bno, proNo);
		}
		
		return result;
	}

	@Override
	public ProductDto getRelatedProduct(long proNo) {
		return productMapper.getProduct(proNo);
	}

	@Override
	public BoardDto getNotice() {
		return boardMapper.selectNotice();
	}

	@Override
	public MembersDto getUser(long mno) {
		
		return membersMapper.getMember(mno);
	}

	@Override
	public List<BoardDto> getReviews(long mno) {
		return boardMapper.selectReview(mno);
	}

	@Override
	public String getProductCategory(long pcno) {
		return categoryMapper.selectPC(pcno);
	}

	@Override
	public String updateEditorImage(MultiValueMap<String, MultipartFile> multiValueMap) {
		MultipartFile fileload = multiValueMap.get("upload").get(0);
		String fileName = fileload.getOriginalFilename();

		int index = fileName.lastIndexOf(".");
		String ext = fileName.substring(index+1);
		Random ran = new Random(System.currentTimeMillis());
		fileName = System.currentTimeMillis()+"_"+(int)(ran.nextDouble()*10000)+"."+ext;

		File targetFile = new File(absolutePath+ File.separator + fileName);
		try {
			FileCopyUtils.copy(fileload.getInputStream(), new FileOutputStream(targetFile));
		}catch (Exception e) {
			e.printStackTrace();
		}

		return path+ File.separator + fileName;
	}

}
