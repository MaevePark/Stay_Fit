package kh.project.stayfit.seller.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.admin.model.vo.AdminDashboard1;
import kh.project.stayfit.admin.model.vo.AdminDashboard2;
import kh.project.stayfit.admin.model.vo.AdminDashboard3;

@Repository
public class SellerDashboardDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	// 첫번째 차트
	public List<AdminDashboard1> selectChart1(String year) throws Exception{
		return sqlsession.selectList("seller.selectChart1", year) ;
	}
	
	// 두번째 차트
	public List<AdminDashboard2> selectChart2() throws Exception{
		return sqlsession.selectList("seller.selectChart2") ;
	}
	
	// 세번째 차트
	public List<AdminDashboard3> selectChart3() throws Exception{
		return sqlsession.selectList("seller.selectChart3") ;
	}

}
