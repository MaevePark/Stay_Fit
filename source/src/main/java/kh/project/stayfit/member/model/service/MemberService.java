package kh.project.stayfit.member.model.service;


public interface MemberService {
	public int login(String a, String b); // login(String, String): int
	public int insert(String a ,String b , String c); // insert(String, String, String): int
	public int mailChk(String a); // mailChk(String): int
}
