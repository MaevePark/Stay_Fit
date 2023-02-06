package kh.project.stayfit.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.admin.model.vo.AdminDashboard1;

@Repository
public class DashboardDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	// 첫번째 차트
	public List<AdminDashboard1> selectChart1() throws Exception{
		
		return sqlsession.selectList("admin.selectChart1") ;
	}

}
