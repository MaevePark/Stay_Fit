package kh.project.stayfit.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDao {
	@Autowired
	private SqlSession sqlsession;

}
