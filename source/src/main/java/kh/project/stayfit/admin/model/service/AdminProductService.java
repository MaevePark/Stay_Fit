package kh.project.stayfit.admin.model.service;

import java.util.List;

import kh.project.stayfit.seller.model.vo.SellerProduct;

public interface AdminProductService {
	
	// 상품목록조회
	public List<SellerProduct> selectProduct(String searchword, String category, String sort) throws Exception;

}
