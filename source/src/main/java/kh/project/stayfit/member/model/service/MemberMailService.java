package kh.project.stayfit.member.model.service;

public interface MemberMailService {
	public int codeSend(String a, String b); // codeSend(String, String): int
	public int mailCode(String a, String b); // mailCode(String, String): int
	public int codeChk(String a, String b); // codeChk(String, String): int
}
