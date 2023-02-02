package kh.project.stayfit.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

@Repository
public class ProfileDao {
	@Autowired
	private SqlSession sqlsession;
	
	//사용자 정보 변경
	public int editProfile(String a, String b, MultipartFile c, int d) throws Exception {
		return 0;
	}
	//계정 탈퇴
	public int delProfile(int a) throws Exception {
		return 0;
	}
}
