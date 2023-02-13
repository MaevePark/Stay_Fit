package kh.project.stayfit.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.admin.model.vo.AdminBoard;
import kh.project.stayfit.admin.model.vo.AdminMember;

@Repository
public class AdminBoardDao {

	@Autowired
	private SqlSession sqlsession;

	// 목록 출력
	public List<AdminBoard> selectBoard(String searchword, String category, String state) throws Exception {

		// 매개변수 여러개를 넘겨줘야 하는 경우 -> Map으로 하나로 만듦
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchword", searchword);
		map.put("category", category);
		map.put("state", state);

		return sqlsession.selectList("admin.selectBoard", map);
	}

	// 게시물 삭제
	public int deleteBoard(String bid) throws Exception {
		
		return sqlsession.delete("admin.deleteBoard", bid);
	}

}
