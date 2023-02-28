package kh.project.stayfit.shop.model.service;

import java.util.List;

import kh.project.stayfit.shop.model.vo.Nutrition;

public interface ShopService {
	
//	//쇼핑몰 페이지
//	//카테고리, 페이징
//	public List<Product> selectProduct(String, String, int, int, int, int) throws Exception;
//	public int selectTotalCnt(String, String, int, int) throws Exception;
//	//추천 상품
//	public List<Product> selectCustomProduct(int, ???) throws Exception;
	
//	//상품 조건별 출력(검색), 페이징
//	public List<Product> selectProduct(String, String, int, int, int, int) throws Exception;
//	public int selectTotalCnt(String, String, int, int) throws Exception;

//	//찜 목록에 추가
//	public int addWish(int, int, int) throws Exception;

//	//장바구니에 추가
//	public int addBasket(int, int, int) throws Exception;
	
	public int insertNutrition(List<Nutrition> nvoList) throws Exception;
	
	

}
