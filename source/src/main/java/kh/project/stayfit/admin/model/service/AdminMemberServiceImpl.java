package kh.project.stayfit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminMemberDao;

@Service
public class AdminMemberServiceImpl implements AdminMemberService{
	@Autowired
	private AdminMemberDao dao;
}
