package kh.project.stayfit.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReplyDao {
	@Autowired
	private SqlSession sqlsession;

//	//댓글 작성
//	public int write(Reply) throws Exception{
//		return sqlsession.;
//	}
//	
//	//대댓글 작성
//	public int answer(Reply) throws Exception{
//		return sqlsession.;
//	}
//	
//	//댓글 수정
//	public int update(Reply, int) throws Exception{
//		return sqlsession.;
//	}
//	
//	//댓글 삭제
//	public int delete(int) throws Exception{
//		return sqlsession.;
//	}
//	
//	//댓글 신고
//	public int report(Reply, int) throws Exception{
//		return sqlsession.;
//	}
//	
//	//댓글 좋아요
//	public int like(int, int) throws Exception{
//		return sqlsession.;
//	}
//	
//	//답변 선택
//	public int adopt(int, int, int, int) throws Exception{
//		return sqlsession.;
//	}
	
}
