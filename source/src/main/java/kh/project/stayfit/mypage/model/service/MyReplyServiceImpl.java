package kh.project.stayfit.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.mypage.model.dao.MyReplyDao;

@Service
public class MyReplyServiceImpl implements MyReplyService {
	@Autowired
	private MyReplyDao dao;
	
	//TODO 담당자가 MyReplyService 해결 후 override
}
