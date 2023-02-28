package kh.project.stayfit.mypage.model.service;

import java.util.List;
import java.util.Map;

import kh.project.stayfit.mypage.model.vo.MypageOrder;
import kh.project.stayfit.shop.model.vo.ShopProduct;

public interface MyProductService {
	
	//찜목록 호출
	public List<ShopProduct> selectWishProductList(int mid, int currentPageNum, int limits) throws Exception;
	public int selectWishTotalCnt(int mid) throws Exception;
	
	//장바구니 호출
	public List<Map<String, Object>> selectCartProductList(int mid, int currentPageNum, int limits) throws Exception;
	public int selectCartTotalCnt(int mid) throws Exception;
	
	//구매기록 호출
	public List<Map<String, Object>> selectOrderProductList(int mid, int currentPageNum, int limits) throws Exception;
	public int selectOrderTotalCnt(int mid) throws Exception;
	
}
