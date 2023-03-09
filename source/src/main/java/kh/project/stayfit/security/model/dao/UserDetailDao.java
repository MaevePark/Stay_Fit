package kh.project.stayfit.security.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.security.model.dto.UserDetailsDto;

@Repository
public class UserDetailDao{
	@Autowired
	private SqlSession sqlSession;
	
//	public UserDetailsDto selectUser(String memail) throws Exception{
//		System.out.println("여긴 Dao, 여긴 Dao, 이곳에 변수 memail 값이 넘어왔는지 보겠다. memail : "+memail);
//		UserDetailsDto result = sqlSession.selectOne("Dao.selectUser", memail);
//		System.out.println("이거슨 결과!" +result);
//		return result;
//	}
//	
//	public List<String> getAuthList(String memail) throws Exception {
//		return sqlSession.selectList("Dao.getAuthList", memail);
//	}
//	private final SqlSession sqlSession;
//	
//	public UserDetailDao(SqlSession sqlSession) {
//        this.sqlSession = sqlSession;
//    }
	
	
	public UserDetailsDto selectUser(String memail) throws  Exception{
		System.out.println("여긴 Dao, 여긴 Dao, 이곳에 변수 memail 값이 넘어왔는지 보겠다. memail : "+memail);
		UserDetailsDto result = sqlSession.selectOne("Dao.selectUser", memail);
		System.out.println("이거슨 결과!" +result);
		return result;
	}
	
	public List<String> getAuthList(String memail) throws Exception {
		return sqlSession.selectList("Dao.getAuthList", memail);
	}
}
