package kh.project.stayfit.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.main.dao.MainDao;

@Service
public class MainServiceImpl implements MainService {
	@Autowired
	private MainDao dao;
	
	//공지사항
	@Override
	public List<Board> notice() throws Exception {
		return dao.notice();
	}
	//인기글
	@Override
	public List<Board> popular() throws Exception {
		return dao.popular();
	}
	//최신글
	@Override
	public List<Board> recent() throws Exception {
		return dao.recent();
	}

}
