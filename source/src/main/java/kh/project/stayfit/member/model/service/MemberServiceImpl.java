package kh.project.stayfit.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.member.model.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao dao;
	
	@Override
	public int login(String a, String b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int insert(String a, String b, String c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mailChk(String a) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
