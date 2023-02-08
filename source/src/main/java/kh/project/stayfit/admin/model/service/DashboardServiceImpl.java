package kh.project.stayfit.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.DashboardDao;
import kh.project.stayfit.admin.model.vo.AdminDashboard1;
import kh.project.stayfit.admin.model.vo.AdminDashboard2;
import kh.project.stayfit.admin.model.vo.AdminDashboard3;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Autowired
	private DashboardDao dao;
	

	@Override
	public List<AdminDashboard1> selectChart1() throws Exception {
		return dao.selectChart1();
	}

	@Override
	public List<AdminDashboard2> selectChart2() throws Exception {
		return dao.selectChart2();
	}
	
	@Override
	public List<AdminDashboard3> selectChart3() throws Exception {
		return dao.selectChart3();
	}


}