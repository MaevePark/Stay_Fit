package kh.project.stayfit.mypage.model.service;

import org.springframework.web.multipart.MultipartFile;

public interface ProfileService {
	
	//사용자 정보 변경
	public int editProfile(String a, String b, MultipartFile c, int d) throws Exception; //editProfile(String, String, MultipartFile, int): int
	//계정 탈퇴
	public int delProfile(int a) throws Exception; //delProfile(int): int
}
