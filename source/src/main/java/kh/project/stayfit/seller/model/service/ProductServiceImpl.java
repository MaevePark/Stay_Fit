package kh.project.stayfit.seller.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.seller.model.dao.ProductDao;

@Service
public class ProductServiceImpl implements ProductService{
	@Autowired
	private ProductDao dao;

}
