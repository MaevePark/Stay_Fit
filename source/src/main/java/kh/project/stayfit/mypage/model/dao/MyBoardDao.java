package kh.project.stayfit.mypage.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyBoardDao {
	@Autowired
	private SqlSession sqlsession;
	
	//작성글 호출
	public List<Map<String, Object>> selectBoardList(
			int mid
			, String type
			, int boardCategory
			, int searchRange
			, String searchword
			, int currentPageNum
			, int limits
			) throws Exception {
		
		List<Map<String, Object>> result = null;
		
		if(type.equals("bookmark")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectList("mypage.selectBMark", paramList, new RowBounds((currentPageNum-1)*limits, limits));
			
		} else if(type.equals("likereply")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectList("mypage.selectLikeReply", paramList, new RowBounds((currentPageNum-1)*limits, limits));
			
		} else if(type.equals("myboard")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectList("mypage.selectMyBoard", paramList, new RowBounds((currentPageNum-1)*limits, limits));
			
		} else if(type.equals("myreply")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectList("mypage.selectMyReply", paramList, new RowBounds((currentPageNum-1)*limits, limits));
			
		}
		
		return result;
	}
	public int selectTotalCnt(
			int mid
			, String type
			, int boardCategory
			, int searchRange
			, String searchword
			) throws Exception {
		
		int result = 0;
		
		if(type.equals("bookmark")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectOne("mypage.countBMark", paramList);
			
		} else if(type.equals("likereply")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectOne("mypage.countLikeReply", paramList);
			
		} else if(type.equals("myboard")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectOne("mypage.countMyBoard", paramList);
			
		} else if(type.equals("myreply")) {
			Map<String, Object> paramList = new HashMap<String, Object>();
			paramList.put("mid", mid);
			paramList.put("boardCategory", boardCategory);
			paramList.put("searchRange", searchRange);
			paramList.put("searchword", searchword);
			
			result = sqlsession.selectOne("mypage.countMyReply", paramList);
			
		}
		
		return result;
	}
}
