package kh.project.stayfit.health.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;


public class HealthCenterDao {
	@Autowired
	private SqlSession sqlSession;
	
	
}
