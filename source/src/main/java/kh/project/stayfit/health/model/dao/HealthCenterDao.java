package kh.project.stayfit.health.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.health.model.vo.HealthCenter;

@Repository
public class HealthCenterDao {

	@Autowired
	private SqlSession sqlSession;

	// 게시글 목록 조회, 글 검색
	public List<HealthCenter> selectCenter(int lid, String keyword) throws Exception {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("lid", lid);
		param.put("keyword", keyword);
		return sqlSession.selectList("healthcenter.selectCenter",param);
	}
}
