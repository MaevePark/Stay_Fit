package kh.project.stayfit.seller.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.seller.model.dao.ProductDao;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao dao;
	
//	//판매자페이지
//	@Override
//	public int selectTotalCnt(String, int) throws Exception{
//		return ;
//	}
//	@Override
//	public List<Product> selectList(int, int, String, int) throws Exception{
//		return ;
//	}
	
//	//상품수정lo
//	@Override
//	public Product selectOne(int? ) throws Exception{
//		return ;
//	}
	
//	//상품수정do
//	@Override
//	public int update(???, ???) throws Exception{
//		return ;
//	}

//	//상품등록do
//	@Override
//	public int insert(Product) throws Exception{
//		return ;
//	}


}
