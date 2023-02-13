package kh.project.stayfit.admin.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminBoardDao;
import kh.project.stayfit.admin.model.vo.AdminBoard;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDao dao;

	
	@Override
	public List<AdminBoard> selectBoard(String searchword, String category, String state) throws Exception {
		return dao.selectBoard(searchword, category, state);
	}

	//게시물 삭제
	@Override
	public int deleteBoard(String bid) throws Exception {
		return dao.deleteBoard(bid);
	}
	
	
}
