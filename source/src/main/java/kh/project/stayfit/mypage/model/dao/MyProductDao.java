package kh.project.stayfit.mypage.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.mypage.model.vo.MypageOrder;
import kh.project.stayfit.shop.model.vo.ShopProduct;

@Repository
public class MyProductDao {
	@Autowired
	private SqlSession sqlsession;
	
	//찜목록 호출
	public List<ShopProduct> selectWishProductList(int mid, int currentPageNum, int limits) throws Exception {
		return sqlsession.selectList("mypage.selectMyWish", mid, new RowBounds((currentPageNum-1)*limits, limits));
	}
	public int selectWishTotalCnt(int mid) throws Exception {
		return sqlsession.selectOne("mypage.selectMyWishCount", mid);
	}
	
	//장바구니 호출
	public List<ShopProduct> selectCartProductList(int mid, int currentPageNum, int limits) throws Exception {
		return sqlsession.selectList("mypage.selectCart", mid, new RowBounds((currentPageNum-1)*limits, limits));
	}
	public int selectCartTotalCnt(int mid) throws Exception {
		return sqlsession.selectOne("mypage.selectMyCartCount", mid);
	}
	
	//구매기록 호출
	public List<MypageOrder> selectOrderProductList(int mid, int currentPageNum, int limits) throws Exception {
		return sqlsession.selectList("mypage.selectOrder", mid, new RowBounds((currentPageNum-1)*limits, limits));
	} 
	public int selectOrderTotalCnt(int mid) throws Exception {
		return sqlsession.selectOne("mypage.selectMyOrderCount", mid);
	} 
	
}
