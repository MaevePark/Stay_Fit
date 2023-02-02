package kh.project.stayfit.shop.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShopDao {
	@Autowired
	private SqlSession sqlsession;
	
//	//쇼핑몰 페이지
//	//카테고리, 페이징
//	public List<Product> selectProduct(String, String, int, int, int, int) throws Exception{
//		return sqlsession.;
//	}
//	public int selectTotalCnt(String, String, int, int) throws Exception{
//		return sqlsession.;
//	}
//	//추천 상품
//	public List<Product> selectCustomProduct(int, ???) throws Exception{
//		return sqlsession.;
//	}
	
//	//상품 조건별 출력(검색), 페이징
//	public List<Product> selectProduct(String, String, int, int, int, int) throws Exception{
//		return sqlsession.;
//	}
//	public int selectTotalCnt(String, String, int, int) throws Exception{
//		return sqlsession.;
//	}

//	//찜 목록에 추가
//	public int addWish(int, int, int) throws Exception{
//		return sqlsession.;
//	}

//	//장바구니에 추가
//	public int addBasket(int, int, int) throws Exception{
//		return sqlsession.;
//	}	

}
