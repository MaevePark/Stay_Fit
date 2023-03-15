package kh.project.stayfit.shop.model.service;

import java.util.List;
import java.util.Map;

import kh.project.stayfit.mypage.model.vo.MypageCart;
import kh.project.stayfit.shop.model.vo.Category;
import kh.project.stayfit.shop.model.vo.Nutrition;
import kh.project.stayfit.shop.model.vo.ShopCart;
import kh.project.stayfit.shop.model.vo.ShopProduct;

public interface ShopService {
	
//	//쇼핑몰 페이지
//	//카테고리, 페이징
	public List<Category> selectCategory() throws Exception;
	public List<ShopProduct> selectProductList(Map<String, Object> searchMap, int page, int limits) throws Exception;
	public int selectProductTotalCnt(Map<String, Object> searchMap) throws Exception;
	//할인상품
	public List<ShopProduct> selectSaleList() throws Exception;
	

	//찜목록 등록
	public int insertWish(ShopCart vo) throws Exception;
	
	//장바구니 등록
	public int insertCart(ShopCart vo) throws Exception;
	
	public int insertNutrition(List<Nutrition> nvoList) throws Exception;
	
	public int insertProduct(List<ShopProduct> spvoList) throws Exception;


}
