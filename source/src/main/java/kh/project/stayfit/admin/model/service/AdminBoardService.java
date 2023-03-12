package kh.project.stayfit.admin.model.service;

import java.util.List;

import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;

import kh.project.stayfit.admin.model.vo.AdminBoard;
import kh.project.stayfit.admin.model.vo.AdminReport;

public interface AdminBoardService {
	
	//게시물목록조회
	public List<AdminBoard> selectBoard(String searchword, String category, String state) throws Exception;
	
	//게시물삭제
	public int deleteBoard(List<String> bidList) throws Exception;

	//신고댓글목록조회
	public List<AdminReport> selectReport(String reason, String sort) throws Exception;

	//신고댓글삭제
	public int deleteReply(String rid) throws Exception;
	
	//신고삭제
	public int deleteReport(String rid, String reporter) throws Exception;
}
