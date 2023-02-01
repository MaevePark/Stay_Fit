package kh.project.stayfit.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.board.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;

}
