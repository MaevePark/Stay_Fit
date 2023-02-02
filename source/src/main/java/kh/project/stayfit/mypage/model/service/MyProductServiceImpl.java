package kh.project.stayfit.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.mypage.model.dao.MyProductDao;

@Service
public class MyProductServiceImpl implements MyProductService {
	@Autowired
	private MyProductDao dao;
	
	//TODO 담당자가 MyProductService 해결 후 override
	

}
