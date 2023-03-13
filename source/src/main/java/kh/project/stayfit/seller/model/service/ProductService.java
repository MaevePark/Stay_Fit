package kh.project.stayfit.seller.model.service;

import java.util.List;

import kh.project.stayfit.seller.model.vo.SellerProduct;

public interface ProductService {

	// 상품목록조회
	public List<SellerProduct> selectProduct(String searchword, String category, String sort) throws Exception;

	// 상품수정
	public int updateProduct(SellerProduct vo) throws Exception;

	// 상품삭제
	public int deleteProduct(List<String> pidList) throws Exception;
	
	// 상품등록
	public int insertProduct(SellerProduct vo) throws Exception;
}
