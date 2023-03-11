package kh.project.stayfit.shop.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.mypage.model.vo.MypageCart;
import kh.project.stayfit.mypage.model.vo.MypageWish;
import kh.project.stayfit.shop.model.dao.ShopDao;
import kh.project.stayfit.shop.model.vo.Category;
import kh.project.stayfit.shop.model.vo.Nutrition;
import kh.project.stayfit.shop.model.vo.ShopCart;
import kh.project.stayfit.shop.model.vo.ShopProduct;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopDao dao;
	
//	//쇼핑몰 페이지
//	//카테고리, 페이징
	@Override
	public List<Category> selectCategory() throws Exception {
		return dao.selectCategory();
	}
	@Override
	public List<ShopProduct> selectProductList(Map<String, Object> searchMap, int page, int limits) throws Exception{
		return dao.selectProductList(searchMap, page, limits);
	}
	@Override
	public int selectProductTotalCnt(Map<String, Object> searchMap) throws Exception{
		return dao.selectProductTotalCnt(searchMap);
	}
	
	//할인상품
	public List<ShopProduct> selectSaleList() throws Exception {
		return  dao.selectSaleList();
	}
	
	//찜목록 등록
	public int insertWish(ShopCart vo) throws Exception {
		return dao.insertWish(vo);
	}
	
	//장바구니 등록
	@Override
	public int insertCart(ShopCart vo) throws Exception {
		return dao.insertCart(vo);
	}
	
	
//	//추천 상품
//	@Override
//	public List<Product> selectCustomProduct(int, ???) throws Exception{
//		return ;
//	}

	
//	//상품 조건별 출력(검색), 페이징
//	@Override
//	public List<Product> selectProduct(String, String, int, int, int, int) throws Exception{
//		return ;
//	}
//	@Override
//	public int selectTotalCnt(String, String, int, int) throws Exception{
//		return ;
//	}

	
//	//찜 목록에 추가
//	@Override
//	public int addWish(int, int, int) throws Exception{
//		return ;
//	}

		
//	//장바구니에 추가
//	@Override
//	public int addBasket(int, int, int) throws Exception{
//		return ;
//	}
	
	@Override
	public int insertNutrition(List<Nutrition> nvoList) throws Exception{
		int result = 0;
		result = dao.insertNutrition(nvoList);
		return result;
	}
	
	@Override
	public int insertProduct(List<ShopProduct> spvoList) throws Exception{
		int result = 0;
		result = dao.insertProduct(spvoList);
		return result;
	}

}
