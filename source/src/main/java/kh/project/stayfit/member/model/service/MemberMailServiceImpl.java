package kh.project.stayfit.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.member.model.dao.MemberDao;

@Service
public class MemberMailServiceImpl implements MemberMailService {
	@Autowired
	private MemberDao dao;

	@Override
	public int codeSend(String a, String b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int mailCode(String a, String b) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int codeChk(String a, String b) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
