package kh.project.stayfit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminBoardDao;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	@Autowired 
	private AdminBoardDao dao;
	

}
