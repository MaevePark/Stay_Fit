package kh.project.stayfit.health.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.health.model.vo.HealthCenter;

@Repository
public class HealthCenterDao {

	@Autowired
	private SqlSession sqlSession;

	// 게시글 목록 조회, 글 검색
	public List<HealthCenter> selectCenterlist(int lid, String search, String keyword, int currentPageNum, int limits) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("keyword", keyword);
		return sqlSession.selectList("healthcenter.selectCenter", map, new RowBounds((currentPageNum-1)*limits, limits));
	}
	// 개시글 총 개수
	public int totalPageCnt(String search, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("search", search);
		map.put("keyword", keyword);
		return sqlSession.selectOne("healthcenter.totalPageCnt", map);
	}
}
