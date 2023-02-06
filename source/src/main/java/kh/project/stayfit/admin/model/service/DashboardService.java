package kh.project.stayfit.admin.model.service;

import java.util.List;

import kh.project.stayfit.admin.model.vo.AdminDashboard1;

public interface DashboardService {
	
	// 첫번째 차트
	public List<AdminDashboard1> selectChart1() throws Exception;

}
