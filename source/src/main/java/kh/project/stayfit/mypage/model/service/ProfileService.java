package kh.project.stayfit.mypage.model.service;

import java.util.Map;

import kh.project.stayfit.mypage.model.vo.MypageMember;

public interface ProfileService {
	
	//사용자 정보 조회
	public MypageMember selectMember(int mid) throws Exception;
	//사용자 정보 변경
	public int editProfile(Map<String, Object> updateMap) throws Exception; //editProfile(String, String, MultipartFile, int): int
	//계정 탈퇴
	public int delProfile(int a) throws Exception; //delProfile(int): int
}
