package kh.project.stayfit.mypage.model.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.project.stayfit.mypage.model.dao.ProfileDao;
import kh.project.stayfit.mypage.model.vo.MypageMember;

@Service
public class ProfileServiceImpl implements ProfileService {
	@Autowired
	private ProfileDao dao;
	
	//사용자 정보 조회
	public MypageMember selectMember(int mid) throws Exception {
		return dao.selectMember(mid);
	}
	
	//사용자 정보 변경
	@Override
	public int editProfile(Map<String, Object> updateMap) throws Exception {
		System.out.println("----------------------------------------------------------");
		System.out.println("service 영역");
		System.out.println(updateMap.get("mname"));
		System.out.println(updateMap.get("pwd"));
		System.out.println(updateMap.get("profimg"));
		System.out.println(updateMap.get("mid"));
		return dao.editProfile(updateMap);
	}
	//계정 탈퇴
	@Override
	public int delProfile(int a) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
