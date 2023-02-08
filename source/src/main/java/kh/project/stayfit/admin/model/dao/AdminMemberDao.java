package kh.project.stayfit.admin.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.admin.model.vo.AdminMember;

@Repository
public class AdminMemberDao {
	
	@Autowired
	private SqlSession sqlsession;
	
	
	public List<AdminMember> selectMember() throws Exception {
		return sqlsession.selectList("admin.selectMember");
	}

}
