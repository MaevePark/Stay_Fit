package kh.project.stayfit.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminBoardDao {
	@Autowired
	private SqlSession sqlsession;
	
//	//상품 목록 페이지
//	public int selectTotalCnt(String , int) throws Exception{
//		return sqlsession.;
//	}
//	public List<Board> List(int, int, String, int) throws Exception{
//		return sqlsession.;
//	}
//	
//	//게시물삭제
//	public int delete(int) throws Exception{
//		return sqlsession.;
//	}
//	
//	//신고 댓글 목록페이지
//	public int selectTotalRCnt() throws Exception{
//		return sqlsession.;
//	}
//	public List<Report> selectRList(int, int) throws Exception;{
//		return sqlsession
//	}	
//	//신고 댓글 삭제 lo
//	public int reportDelete(int) thorws Exception{
//		return sqlsession.;
//	}
	

}
