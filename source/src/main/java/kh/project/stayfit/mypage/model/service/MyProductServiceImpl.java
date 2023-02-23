package kh.project.stayfit.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.mypage.model.dao.MyProductDao;
import kh.project.stayfit.mypage.model.vo.MypageOrder;
import kh.project.stayfit.shop.model.vo.ShopProduct;

@Service
public class MyProductServiceImpl implements MyProductService {
	@Autowired
	private MyProductDao dao;
	
	@Override
	//찜목록 호출
	public List<ShopProduct> selectWishProductList(int mid, int currentPageNum, int limits) throws Exception {
		return dao.selectWishProductList(mid, currentPageNum, limits);
	}
	@Override
	public int selectWishTotalCnt(int mid) throws Exception {
		return dao.selectWishTotalCnt(mid);
	}
	
	@Override
	//장바구니 호출
	public List<ShopProduct> selectCartProductList(int mid, int currentPageNum, int limits) throws Exception {
		return dao.selectCartProductList(mid, currentPageNum, limits);
	}
	@Override
	public int selectCartTotalCnt(int mid) throws Exception {
		return dao.selectCartTotalCnt(mid);
	}
	
	public List<MypageOrder> selectOrderProductList(int mid, int currentPageNum, int limits) throws Exception {
		return dao.selectOrderProductList(mid, currentPageNum, limits);
	}
	public int selectOrderTotalCnt(int mid) throws Exception {
		return dao.selectOrderTotalCnt(mid);
	}
	

}
