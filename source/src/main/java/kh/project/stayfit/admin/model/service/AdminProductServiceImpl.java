package kh.project.stayfit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminProductDao;

@Service
public class AdminProductServiceImpl implements AdminProductService{
	@Autowired
	private AdminProductDao dao;
	
//	//상품 목록 페이지
//	@Override
//	public int selectTotalCnt(String, int) throws Exception{
//		return ;
//	}
//	@Override
//	public List<Product> selectList(int, int, String, int) throws Exception{
//		return ;
//	}
}
