package kh.project.stayfit.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.mypage.model.vo.MypageCart;
import kh.project.stayfit.mypage.model.vo.MypageOrder;
import kh.project.stayfit.mypage.model.vo.MypageWish;
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
	//찜목록 삭제
	public int deleteWish(MypageWish vo) {
		return sqlsession.delete("mypage.deleteMyWish", vo);
	}
	//찜목록 등록
//	public int insertWish(MypageWish vo) {
//		return sqlsession.delete("mypage.deleteMyWish", vo);
//	}
	
	//장바구니 호출
	public List<Map<String, Object>> selectCartProductList(int mid, int currentPageNum, int limits) throws Exception {
		return sqlsession.selectList("mypage.selectCart", mid, new RowBounds((currentPageNum-1)*limits, limits));
	}
	public int selectCartTotalCnt(int mid) throws Exception {
		return sqlsession.selectOne("mypage.selectMyCartCount", mid);
	}
	//장바구니 등록
	public int insertCart(MypageWish vo) {
		return sqlsession.insert("mypage.insertCart", vo);
	}
	//장바구니 수량 수정
	public int updateCart(MypageCart vo) {
		return sqlsession.update("mypage.updateProductCount", vo);
	}
	//장바구니 삭제
	public int deleteCart(MypageCart vo) {
		return sqlsession.update("mypage.deleteCart", vo);
	}
	
	//구매기록 호출
	public List<Map<String, Object>> selectOrderProductList(int mid, int currentPageNum, int limits) throws Exception {
		return sqlsession.selectList("mypage.selectOrder", mid, new RowBounds((currentPageNum-1)*limits, limits));
	} 
	public int selectOrderTotalCnt(int mid) throws Exception {
		return sqlsession.selectOne("mypage.selectMyOrderCount", mid);
	} 
	//구매기록 추가
	public int insertOrder(MypageOrder vo) throws Exception {
		int result = 0;
		sqlsession.insert("mypage.insertOrder", vo);
		System.out.println(vo.getResult());
		result = vo.getResult();
		return result;
	}
	
}
