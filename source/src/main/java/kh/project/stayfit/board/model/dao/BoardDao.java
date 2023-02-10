package kh.project.stayfit.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.board.model.vo.Board;

@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlsession;
	
	//게시판 list페이지 글목록 출력
	public List<Board> boardlist() {
		List<Board> blist = null;
		blist = sqlsession.selectList("board.selectboard");
		return blist;
	}
	
	//게시글 read 상세페이지
	public Board read(int bid){
		Board bone = null;
		bone = sqlsession.selectOne("board.selectone", bid);
		return bone;
	} 

//	//커뮤니티 글목록 페이지,페이징
//	public List<Board> selectList(int, int) throws Exception{
//		return sqlsession.;
//	}
//	public int selectTotalCnt() throws Exception{
//		return sqlsession.;
//	}
	
//	//게시판 글 등록
//	public int write(Board) throws Exception{
//		return sqlsession.;
//	}
	
//	//게시판 글 검색, 페이징
//	public List<Board> selectList(int ,int , String ) throws Exception{
//		return sqlsession.;
//	}
//	public int selectTotalCnt(String) throws Exception{
//		return sqlsession.;
//	}
	
//	//게시글 수정
//	public int update(Board ) throws Exception{
//		return sqlsession.;
//	}
	
//	//게시글 삭제
//	public int delete(int) throws Exception{
//		return sqlsession.;
//	}
	
//	//게시글 상세페이지
//	public List<Board> read(int ) throws Exception{
//		return sqlsession.;
//	}
//	public List<Reply> seletList(int) throws Exception{
//		return sqlsession.;
//	}
	
//	//게시글 북마크
//	public int bmark(int ,String , ???) throws Exception{
//		return sqlsession.;
//	}
	
//	//게시글 반응
//	public int emotion(int ,int ,int ) throws Exception{
//		return sqlsession.;
//	}	

}
