package kh.project.stayfit.seller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.DashboardDao;
import kh.project.stayfit.admin.model.vo.AdminDashboard1;
import kh.project.stayfit.admin.model.vo.AdminDashboard2;
import kh.project.stayfit.admin.model.vo.AdminDashboard3;
import kh.project.stayfit.seller.model.dao.SellerDashboardDao;

@Service
public class SellerDashboardServiceImpl implements SellerDashboardService {
	
	@Autowired
	private SellerDashboardDao dao;
	

	@Override
	public List<AdminDashboard1> selectChart1(String year) throws Exception {
		return dao.selectChart1(year);
	}

	@Override
	public List<AdminDashboard2> selectChart2() throws Exception {
		return dao.selectChart2();
	}
	
	@Override
	public List<AdminDashboard3> selectChart3(String year) throws Exception {
		return dao.selectChart3(year);
	}


}