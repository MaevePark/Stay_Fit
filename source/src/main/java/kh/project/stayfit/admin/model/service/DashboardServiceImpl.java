package kh.project.stayfit.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.DashboardDao;
import kh.project.stayfit.admin.model.vo.AdminDashboard1;

@Service
public class DashboardServiceImpl implements DashboardService {
	
	@Autowired
	private DashboardDao dao;
	

	@Override
	public List<AdminDashboard1> selectChart1() throws Exception {
		
		return dao.selectChart1();
	}

}