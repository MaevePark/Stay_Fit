package kh.project.stayfit.shop.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.shop.model.dao.ShopDao;
import kh.project.stayfit.shop.model.vo.Nutrition;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopDao dao;
	
//	//쇼핑몰 페이지
//	//카테고리, 페이징
//	@Override
//	public List<Product> selectProduct(String, String, int, int, int, int) throws Exception{
//		return ;
//	}
//	@Override
//	public int selectTotalCnt(String, String, int, int) throws Exception{
//		return ;
//	}
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

}
