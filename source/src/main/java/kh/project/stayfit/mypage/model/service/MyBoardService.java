package kh.project.stayfit.mypage.model.service;

import java.util.List;
import java.util.Map;


public interface MyBoardService {
	
	//작성글 호출
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
