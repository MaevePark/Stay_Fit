package kh.project.stayfit.mypage.model.service;

import java.util.List;
import java.util.Map;


public interface MyBoardService {
	
	// 게시판 북마크, 관심 댓글, 작성한 글, 작성한 댓글 
	public List<Map<String, Object>> selectBoardList(
			int mid
			, String type
			, int boardCategory
			, int searchRange
			, String searchword
			, int page
			, int limits
			) throws Exception;
	public int selectBoardTotalCnt(
			int mid
			, String type
			, int boardCategory
			, int searchRange
			, String searchword
			) throws Exception;
	
	
}
