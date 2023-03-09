package kh.project.stayfit.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.board.model.vo.Reply;

@Repository
public class ReplyDao {
	@Autowired
	private SqlSession sqlsession;
	
	//댓글list
	public List<Reply> replylist(int bid) {
		List<Reply> rlist = sqlsession.selectList("board.boardreply", bid);
		return rlist;
	}
	//댓글 작성
	public int write(Reply vo) throws Exception{
		return sqlsession.insert("board.writereply", vo);
	}
	
	//댓글 삭제
	public int rdelete(int rid) throws Exception{
		return sqlsession.delete("board.rdelete", rid);
	}
	
//	//대댓글 작성
//	public int answer(Reply) throws Exception{
//		return sqlsession.;
//	}

//	//댓글 수정
//	public int update(Reply, int) throws Exception{
//		return sqlsession.;
//	}

//	//댓글 신고
//	public int report(Reply, int) throws Exception{
//		return sqlsession.;
//	}

//	//댓글 좋아요
//	public int like(int, int) throws Exception{
//		return sqlsession.;
//	}
	
//	//답변 선택
//	public int adopt(int, int, int, int) throws Exception{
//		return sqlsession.;
//	}
	
}
