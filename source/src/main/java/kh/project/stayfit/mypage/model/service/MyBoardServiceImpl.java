package kh.project.stayfit.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.mypage.model.dao.MyBoardDao;

@Service
public class MyBoardServiceImpl implements MyBoardService {
	@Autowired
	private MyBoardDao dao;
	
	//TODO 담당자가 MyProductService 해결 후 override
}
