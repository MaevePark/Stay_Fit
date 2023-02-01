package kh.project.stayfit.shop.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.shop.model.dao.ShopDao;

@Service
public class ShopServiceImpl implements ShopService{
	@Autowired
	private ShopDao dao;

}
