package kh.project.stayfit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminProductDao;

@Service
public class AdminProductServiceImpl implements AdminProductService{
	@Autowired
	private AdminProductDao dao;
}