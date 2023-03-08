package kh.project.stayfit.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import javax.servlet.http.HttpSession;

import kh.project.stayfit.member.model.dao.MemberDao;
import kh.project.stayfit.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDao memberDao;
	
	@Override
	public boolean loginCheck(Member member, HttpSession session) {
		boolean result = memberDao.loginCheck(member);
		if(result) { //true일 경우 세션에 등록
			Member m = viewMember(member);
			//세션 변수 등록
			session.setAttribute("memail", m.getMemail());
			session.setAttribute("mname", m.getMname());
			session.setAttribute("mid", m.getMid());
		}
		return result; 
	}
	
	@Override
	public Member viewMember(Member member) {
		return memberDao.viewMember(member);
	}
	
	@Override
	public void logout(HttpSession session) {
		//세션 정보 초기화
		session.invalidate();
	}
	
//	@Autowired
//	public int login(Member m, HttpSession session) {
//		return 0;
//	}

//	@Override
	public int join(Member member) {
		return memberDao.join(member);
	}

	@Override
	public int mailChk(String a) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public int join(Member m) {
//		// TODO Auto-generated method stub
//		return 0;
//	}
}
