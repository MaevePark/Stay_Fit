package kh.project.stayfit.admin.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminProductDao {
	@Autowired
	private SqlSession sqlsession;
	
//	//상품 목록 페이지
//	public int selectTotalCnt(String, int) throws Exception{
//		return sqlsession.;
//	}
//	public List<Product> selectList(int, int, String, int) throws Exception{
//		return sqlsession.;
//	}

}
