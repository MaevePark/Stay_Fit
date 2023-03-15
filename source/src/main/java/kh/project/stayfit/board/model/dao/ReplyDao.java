package kh.project.stayfit.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.board.model.vo.Reply;

@Repository
public class ReplyDao {
	@Autowired
	private SqlSession sqlsession;

	// 댓글list
	public List<Reply> replylist(int bid) {
		List<Reply> rlist = sqlsession.selectList("board.boardreply", bid);
		return rlist;
	}
	
	//댓글 list 갯수
	public int rtotalCnt(int bid) {
		return sqlsession.selectOne("board.rtotalCnt", bid);
	}

	// 부모 댓글 작성
	public int write(Reply vo) throws Exception {
		return sqlsession.insert("board.rwrite", vo);
	}
	
	// 자식 댓글 작성
	public int cwrite(Reply vo) throws Exception {
		return sqlsession.insert("board.crwrite", vo);
	}

	// 댓글 수정
	public int update(Reply vo) throws Exception {
		return sqlsession.insert("board.rupdate", vo);
	}

	// 댓글 삭제
	public int delete(int rid) throws Exception {
		return sqlsession.delete("board.rdelete", rid);
	}

	// 댓글 좋아요 카운트
	public int checklike(int rid, int mid) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rid", rid);
		map.put("mid", mid);
		return sqlsession.selectOne("board.checklike", map);
	}

	// 댓글 좋아요
	public int like(int rid, int mid) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rid", rid);
		map.put("mid", mid);
		return sqlsession.update("board.rlike", map);
	}

	// 댓글 좋아요 삭제
	public int unlike(int rid, int mid) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("rid", rid);
		map.put("mid", mid);
		return sqlsession.delete("board.dellike", map);
	}

	// 북마크 카운트
	public int checkbook(int mid, int bid) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("bid", bid);
		return sqlsession.selectOne("board.checkbook", map);
	}

	// 북마크
	public int book(int mid, int bid) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("bid", bid);
		return sqlsession.update("board.book", map);
	}

	// 북마크 취소
	public int delbook(int mid, int bid) throws Exception {
		Map<String, Object> map = new HashMap<>();
		map.put("mid", mid);
		map.put("bid", bid);
		return sqlsession.delete("board.delbook", map);
	}
	//댓글 신고
    public int report(int mid, int rid, int repid) {
        Map<String, Integer> map = new HashMap<>();
        map.put("mid", mid);
        map.put("rid", rid);
        map.put("repid", repid);
        return sqlsession.insert("board.report", map);
    }


//	//답변 선택
//	public int adopt(int, int, int, int) throws Exception{
//		return sqlsession.;
//	}

}
