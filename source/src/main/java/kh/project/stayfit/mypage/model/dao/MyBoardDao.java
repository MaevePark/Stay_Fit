package kh.project.stayfit.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyBoardDao {
	@Autowired
	private SqlSession sqlsession;
	
	//작성글 호출
//	public List<Board> selectBoardList(int a, int b, String c) throws Exception {
//		return null;
//	}
//	public int selectTotalCnt(int a, int b, String c) throws Exception {
//		return 0;
//	}
	
	//북마크 호출
//	public List<Bmark> selectBoardList(int a, int b, String c) throws Exception {
//		return null;
//	}
//	public int selectTotalCnt(int a, int b, String c) throws Exception {
//		return 0;
//	}
}
