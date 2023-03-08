package kh.project.stayfit.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.board.model.vo.Board;

@Repository
public class MainDao {
	@Autowired
	private SqlSession sqlsession;
	
	//공지사항
	public List<Board> notice() {
		return sqlsession.selectList("main.notice");
	}
	//인기글
	public List<Board> popular() {
		return sqlsession.selectList("main.popular");
	}
	//최신글
	public List<Board> recent() {
		return sqlsession.selectList("main.recent");
	}

}
