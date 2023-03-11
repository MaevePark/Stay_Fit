package kh.project.stayfit.member.model.service;

public interface MemberMailService {
	public String EmailForm(String memail); // codeSend(String, String): int
	public void mailCode(); // mailCode(String, String): int
	public void mailSend(String setFrom, String toMail, String title, String content);
//	public void mailSend();
	public int codeChk(String a, String b); // codeChk(String, String): int
}
