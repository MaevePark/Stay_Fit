package kh.project.stayfit.shop.model.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.mypage.model.vo.MypageCart;
import kh.project.stayfit.mypage.model.vo.MypageWish;
import kh.project.stayfit.shop.model.vo.Category;
import kh.project.stayfit.shop.model.vo.Nutrition;
import kh.project.stayfit.shop.model.vo.ShopCart;
import kh.project.stayfit.shop.model.vo.ShopProduct;

@Repository
public class ShopDao {
	@Autowired
	private SqlSession sqlsession;
	
//	//쇼핑몰 페이지
//	//카테고리, 페이징
	public List<Category> selectCategory() throws Exception {
		return sqlsession.selectList("shop.selectCategory");
	}
	public List<ShopProduct> selectProductList(Map<String, Object> searchMap, int page, int limits) throws Exception{
		return sqlsession.selectList("shop.selectProduct", searchMap, new RowBounds((page-1)*limits, limits));
	}
	public int selectProductTotalCnt(Map<String, Object> searchMap) throws Exception {
		System.out.println(searchMap.get("productCategory"));
		System.out.println(searchMap.get("searchProduct"));
		return sqlsession.selectOne("shop.countProduct", searchMap);
	}
	
	//할인상품
	public List<ShopProduct> selectSaleList() throws Exception {
		return sqlsession.selectList("shop.selectSale");
	}
	
	//장바구니 등록
	public int insertWish(ShopCart vo) throws Exception {
		return sqlsession.insert("shop.insertWish", vo);
	}
	
	//장바구니 등록
	public int insertCart(ShopCart vo) throws Exception {
		return sqlsession.insert("shop.insertCart", vo);
	}
	
	
	
	
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

	
	
	//영양데이터 insert
	public int insertNutrition(List<Nutrition> nvoList) throws Exception{
		int result = 0;
		result = sqlsession.insert("shop.insertNutrition", nvoList);
		return result;
	}
	
	public int insertProduct(List<ShopProduct> nvoList) throws Exception{
		int result = 0;
		result = sqlsession.insert("shop.insertProduct", nvoList);
		return result;
	}

}
