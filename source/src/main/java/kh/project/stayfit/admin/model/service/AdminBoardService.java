package kh.project.stayfit.admin.model.service;

import java.util.List;

import kh.project.stayfit.admin.model.vo.AdminBoard;

public interface AdminBoardService {
	
	//게시물목록조회
	public List<AdminBoard> selectBoard(String searchword, String category, String state) throws Exception;
	
	//게시물삭제
	public int deleteBoard(String bid) throws Exception;


}
