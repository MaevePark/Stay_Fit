package kh.project.stayfit.health.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.health.model.vo.HealthCenter;

@Repository
public class HealthCenterDao {

	@Autowired
	private SqlSession sqlSession;

	// 게시글 목록 조회
	public List<HealthCenter> selectCenter(int lid) throws Exception {
		return sqlSession.selectList("healthcenter.selectCenter");
	}
}
