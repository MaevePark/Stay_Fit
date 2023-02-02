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
	
	public List<HealthCenter> selectList() {
		return null;
		
	}
}
