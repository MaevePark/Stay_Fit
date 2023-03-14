package kh.project.stayfit.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.admin.model.vo.AdminDashboard1;
import kh.project.stayfit.admin.model.vo.AdminMember;

@Repository
public class AdminMemberDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	public List<AdminMember> selectMember(String searchword, String sort) throws Exception {
		
//		return sqlsession.selectList("admin.selectMember", searchword, sort); -> 이렇게 못 적음. 파라미터 하나밖에 못씀
		
		// 매개변수 여러개를 넘겨줘야 하는 경우 -> Map으로 하나로 만듦
		Map<String, String> map = new HashMap<String, String>(); 
		map.put("searchword", searchword);
		map.put("sort", sort);
		
		return sqlsession.selectList("admin.selectMember", map);
	}
	
	// 차트
	public List<AdminDashboard1> selectChart(String mid, String chart) throws Exception{
		
		if(chart.equals("1")) {
			return sqlsession.selectList("admin.selectModalChart1", mid);
		} else if(chart.equals("2")) {
			return sqlsession.selectList("admin.selectModalChart2", mid);
		} else {
			return sqlsession.selectList("admin.selectModalChart3", mid);
		}
	}
}
