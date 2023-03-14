package kh.project.stayfit.mypage.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kh.project.stayfit.mypage.model.vo.MypageMember;

@Repository
public class ProfileDao {
	@Autowired
	private SqlSession sqlsession;
	
	//사용자 정보 조회
	public MypageMember selectMember(int mid) throws Exception {
		return sqlsession.selectOne("mypage.selectProfile", mid);
	}
	
	//사용자 정보 변경
	public int editProfile(Map<String, Object> updateMap) throws Exception {
		System.out.println("----------------------------------------------------------");
		System.out.println("dao 영역");
		System.out.println("mname : "+updateMap.get("mname"));
		System.out.println("pwd : "+updateMap.get("pwd"));
		System.out.println("profimg : "+updateMap.get("profimg"));
		System.out.println("mid : "+updateMap.get("mid"));
		return sqlsession.update("mypage.updateProfile", updateMap);
	}
	//계정 탈퇴
	@Transactional
	public int delProfile(int mid) throws Exception {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		result1 = sqlsession.update("mypage.delProfile", mid);
		if(result1 > 0) {
			result2 = sqlsession.update("mypage.delBoard", mid);
			if(result2 > 0) {
				result = 1;
			}
		} else {
			result = -1;
		}
		
		return result;
	}
}
