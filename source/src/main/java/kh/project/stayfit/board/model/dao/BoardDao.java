package kh.project.stayfit.board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.board.model.vo.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlsession;

	// 게시글 페이지, 글검색, 글출력
	public List<Board> boardlist(int bcid, String search, String keyword, int currentPageNum, int limits) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bcid", bcid);
		map.put("search", search);
		map.put("keyword", keyword);

		return sqlsession.selectList("board.selectboard", map, new RowBounds((currentPageNum - 1) * limits, limits));
	}

	// 게시글 총 갯수
	public int totalCnt(int bcid, String search, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bcid", bcid);
		map.put("search", search);
		map.put("keyword", keyword);
		return sqlsession.selectOne("board.totalCnt", map);
	}

	// 게시글 read 상세페이지
	public Board read(int bid) {
		Board bone = sqlsession.selectOne("board.selectone", bid);
		return bone;
	}

	// 게시글 조회수 증가
	public int bvcupdate(int bid) {
		int bvcount = sqlsession.update("board.bvcupdate", bid);
		return bvcount;
	}

	// 게시글 등록
	public int write(Board vo) throws Exception {
		return sqlsession.insert("board.write", vo);
	}

	// 게시글 수정
	public int update(Board vo) throws Exception {
		return sqlsession.update("board.update", vo);
	}

	// 게시글 삭제
	public int bdelete(int bid) {
		return sqlsession.delete("board.bdelete", bid);
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

//	//게시글 반응
//	public int emotion(int ,int ,int ) throws Exception{
//		return sqlsession.;
//	}	

}
