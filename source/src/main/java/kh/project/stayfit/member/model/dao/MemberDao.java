package kh.project.stayfit.member.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDao {
	@Autowired
	private SqlSession sqlsession;
	
	public int login(String a, String b) { // login(String, String): int
		return 0; 
	}
	public int insert(String a ,String b , String c) { // insert(String, String, String): int
		return 0; 
	}
	public int mailChk(String a) { // mailChk(String): int
		return 0;
	} 
	
}
