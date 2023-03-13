package kh.project.stayfit.seller.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.seller.model.vo.SellerProduct;

@Repository
public class ProductDao {

	@Autowired
	private SqlSession sqlsession;

	
	// 상품목록조회
	public List<SellerProduct> selectProduct(String searchword, String category, String sort) throws Exception {
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchword", searchword);
		map.put("category", category);
		map.put("sort", sort);
		
		return sqlsession.selectList("seller.selectProduct", map);
	}

	// 상품수정
	public int updateProduct(SellerProduct vo) throws Exception {
		return sqlsession.update("seller.updateProduct", vo);
	}
	
	// 상품삭제
	public int deleteProduct(List<String> pidList) throws Exception {
		return sqlsession.delete("seller.deleteProduct", pidList);
	}

	// 상품등록
	public int insertProduct(SellerProduct vo) throws Exception {
		return sqlsession.insert("seller.insertProduct", vo);
	}

}
