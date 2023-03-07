package kh.project.stayfit.member.model.dao;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao{
	
	@Autowired
	SqlSession sqlSession;
	
	@Override
	public boolean loginCheck(Member member) {
		String name = sqlSession.selectOne("member.loginCheck", member);
		return (name == null) ? false : true;
	}
	
	@Override
	public Member viewMember(Member member) {
		return sqlSession.selectOne("member.viewMember", member);
	}
	
	@Override
	public void logout(HttpSession session) {
		
	}
//	public Member getMemberOne(String common, String col) {
//		HashMap<String, Object> map = new HashMap<String, Object>();
//		if(col.equals("memail")) {
//			map.put("memail",common);
//		}else if(col.equals("mname")) {
//			map.put("mname", common);
//		}
//		return sqlSession.selectOne("getMemberOne",map);
//	}
	
	@Override
	public int join(Member member) {
		return sqlSession.insert("join",member);
	}
	
//	public int login(Member m) { // login(String, String): int
//		return sqlsession.selectOne("member.loginCheck", m); 
//	}
//	public int insert(String a ,String b , String c) { // insert(String, String, String): int
//		return 0; 
//	}
	public int mailChk(String a) { // mailChk(String): int
		return 0;
	} 
	
}
