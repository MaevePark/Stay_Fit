package kh.project.stayfit.seller.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.seller.model.dao.ProductDao;
import kh.project.stayfit.seller.model.vo.SellerProduct;

@Service
public class ProductServiceImpl implements ProductService{
	
	@Autowired
	private ProductDao dao;

	
	// 상품목록조회
	@Override
	public List<SellerProduct> selectProduct(String searchword, String category, String sort) throws Exception {
		return dao.selectProduct(searchword, category, sort);
	}

	// 상품수정
	@Override
	public int updateProduct(SellerProduct vo) throws Exception {
		return dao.updateProduct(vo);
	}

	// 상품등록
	@Override
	public int insertProduct(SellerProduct vo) throws Exception {
		return dao.insertProduct(vo);
	}
	



}
