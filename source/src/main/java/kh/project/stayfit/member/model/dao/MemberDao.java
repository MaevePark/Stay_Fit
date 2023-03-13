package kh.project.stayfit.member.model.dao;

import javax.servlet.http.HttpSession;

import kh.project.stayfit.member.model.vo.Member;

public interface MemberDao {
	public boolean loginCheck(Member member);
	public Member viewMember(Member member);
	public void logout(HttpSession session);
	public int join(Member member);
	public int mailChk(String memail); // mailChk(String): int
}
