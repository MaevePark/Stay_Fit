package kh.project.stayfit.seller.model.service;

import java.util.List;

import kh.project.stayfit.admin.model.vo.AdminDashboard1;
import kh.project.stayfit.admin.model.vo.AdminDashboard2;
import kh.project.stayfit.admin.model.vo.AdminDashboard3;

public interface SellerDashboardService {
	
	// 첫번째 차트
	public List<AdminDashboard1> selectChart1(String year) throws Exception;
	
	// 두번째 차트
	public List<AdminDashboard2> selectChart2() throws Exception;
	
	// 세번째 차트
	public List<AdminDashboard3> selectChart3(String year) throws Exception;

}
