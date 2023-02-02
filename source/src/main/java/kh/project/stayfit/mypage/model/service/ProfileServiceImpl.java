package kh.project.stayfit.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kh.project.stayfit.mypage.model.dao.ProfileDao;

@Service
public class ProfileServiceImpl implements ProfileService {
	@Autowired
	private ProfileDao dao;
	
	//사용자 정보 변경
	@Override
	public int editProfile(String a, String b, MultipartFile c, int d) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//계정 탈퇴
	@Override
	public int delProfile(int a) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
}
