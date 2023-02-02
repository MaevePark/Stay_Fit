package kh.project.stayfit.seller.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDao {
	@Autowired
	private SqlSession sqlsession;
	
//	//판매자페이지
//	public int selectTotalCnt(String, int) throws Exception{
//		return sqlsession.;
//	}
//	public List<Product> selectList(int, int, String, int) throws Exception{
//		return sqlsession.;
//	}

//	//상품수정lo
//	public Product selectOne(int? ) throws Exception{
//		return sqlsession.;
//	}

//	//상품수정do
//	public int update(???, ???) throws Exception{
//		return sqlsession.;
//	}

//	//상품등록do
//	public int insert(Product) throws Exception{
//		return sqlsession.;
//	}


}
