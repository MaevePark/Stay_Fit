package kh.project.stayfit.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminMemberDao {
	@Autowired
	private SqlSession sqlsession;
	
//	//회원목록조회
//	public int selectTotalCnt(String ) throws Exception{
//		return sqlsession.;
//	}
//	public List<Member> selectList(int, int, String) throws Exception{
//		return sqlsession.;
//	}

}
