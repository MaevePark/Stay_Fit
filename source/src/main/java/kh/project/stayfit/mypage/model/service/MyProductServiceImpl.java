package kh.project.stayfit.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.mypage.model.dao.MyProductDao;
import kh.project.stayfit.mypage.model.vo.MypageCart;
import kh.project.stayfit.mypage.model.vo.MypageOrder;
import kh.project.stayfit.mypage.model.vo.MypageWish;
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
	public int deleteWish(MypageWish vo) throws Exception {
		return dao.deleteWish(vo);
	}
	
	@Override
	//장바구니 호출
	public List<Map<String, Object>> selectCartProductList(int mid, int currentPageNum, int limits) throws Exception {
		return dao.selectCartProductList(mid, currentPageNum, limits);
	}
	@Override
	public int selectCartTotalCnt(int mid) throws Exception {
		return dao.selectCartTotalCnt(mid);
	}
	//장바구니 등록
	@Override
	public int insertCart(MypageWish vo) throws Exception {
		return dao.insertCart(vo);
	}
	//장바구니 수량 수정
	@Override
	public int updateCart(MypageCart vo) throws Exception{
		return dao.updateCart(vo);
	}
	
	
	public List<Map<String, Object>> selectOrderProductList(int mid, int currentPageNum, int limits) throws Exception {
		return dao.selectOrderProductList(mid, currentPageNum, limits);
	}
	public int selectOrderTotalCnt(int mid) throws Exception {
		return dao.selectOrderTotalCnt(mid);
	}
	

}
