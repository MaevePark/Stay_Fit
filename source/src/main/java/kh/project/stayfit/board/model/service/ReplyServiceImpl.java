package kh.project.stayfit.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.board.model.dao.ReplyDao;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao dao;

}
