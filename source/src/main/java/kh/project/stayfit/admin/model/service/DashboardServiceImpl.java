package kh.project.stayfit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.DashboardDao;

@Service
public class DashboardServiceImpl implements DashboardService {
	@Autowired
	private DashboardDao dao;

}