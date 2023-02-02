package kh.project.stayfit.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyProductDao {
	@Autowired
	private SqlSession sqlsession;
	
	//찜목록 호출
//	public List<Wish> selectProductList(int a, int b, String c) throws Exception {
//		return null;
//	}
//	public int selectTotalCnt(int a, int b, String c) throws Exception {
//		return 0;
//	}
	
	//장바구니 호출
//	public List<Basket> selectProductList(int a, int b, String c) throws Exception {
//		return null;
//	}
//	public int selectTotalCnt(int a, int b, String c) throws Exception {
//		return 0;
//	}
	
	//구매기록 호출
//	public List<Bought> selectProductList(int a, int b, String c) throws Exception {
//		return null;
//	} 
//	public int selectTotalCnt(int a, int b, String c) throws Exception {
//		return 0;
//	} 
	
}
