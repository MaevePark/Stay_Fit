package kh.project.stayfit.member.model.service;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kh.project.stayfit.member.model.vo.Member;

public interface MemberService {
	public boolean loginCheck(Member member, HttpSession session);
	public Member viewMember(Member member);
//	public int login(Member m, HttpSession session);
	public int join(Member member); // insert(String, String, String): int
	public int mailChk(String memail); // mailChk(String): int
	public void pwfind(HttpServletResponse response, Member member);
}
