package kh.project.stayfit.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminProductDao;
import kh.project.stayfit.seller.model.vo.SellerProduct;

@Service
public class AdminProductServiceImpl implements AdminProductService{
	
	@Autowired
	private AdminProductDao dao;

	@Override
	public List<SellerProduct> selectProduct(String searchword, String category, String sort) throws Exception {
		return dao.selectProduct(searchword, category, sort);
	}
	
}
