package kh.project.stayfit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminMemberDao;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	@Autowired
	private AdminMemberDao dao;
	
//	//회원목록조회
//	@Override
//	public int selectTotalCnt(String ) throws Exception{
//		return ;
//	}
//	@Override
//	public List<Member> selectList(int, int, String) throws Exception{
//		return ;
//	}
	
}
