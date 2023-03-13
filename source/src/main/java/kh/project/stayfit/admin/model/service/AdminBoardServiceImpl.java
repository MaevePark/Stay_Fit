package kh.project.stayfit.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminBoardDao;
import kh.project.stayfit.admin.model.vo.AdminBoard;
import kh.project.stayfit.admin.model.vo.AdminReport;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	
	@Autowired
	private AdminBoardDao dao;

	//게시물목록조회
	@Override
	public List<AdminBoard> selectBoard(String searchword, String category, String state) throws Exception {
		return dao.selectBoard(searchword, category, state);
	}

	//게시물 삭제
	@Override
	public int deleteBoard(List<String> bidList) throws Exception {
		return dao.deleteBoard(bidList);
	}
	
	//신고댓글목록조회
	@Override
	public List<AdminReport> selectReport(String reason, String sort) throws Exception {
		return dao.selectReport(reason, sort);
	}
	
	//신고댓글 삭제
	@Override
	public int deleteReply(List<String> ridList) throws Exception {
		return dao.deleteReply(ridList);
	}
	
	//신고 삭제
	@Override
	public int deleteReport(List<Map<String, String>> list) throws Exception {
		return dao.deleteReport(list);
	}
	
	
}
