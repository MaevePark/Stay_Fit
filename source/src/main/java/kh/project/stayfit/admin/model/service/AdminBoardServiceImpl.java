package kh.project.stayfit.admin.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.admin.model.dao.AdminBoardDao;

@Service
public class AdminBoardServiceImpl implements AdminBoardService {
	@Autowired
	private AdminBoardDao dao;
	
	//상품목록페이지
//	@Override
//	public int selectTotalCnt(String , int ) throws Exception{
//		return ;
//	}
//	@Override
//	public List<Board> List(int, int, String, int)throws Exception{
//		return ;
//	} 
	
//	//게시물 삭제
//	@Override
//	public int delete(int) throws Exception{
//		return ;
//	}
	
//	//신고 댓글 목록 페이지
//	@Override
//	public int selectTotalRCnt() throws Exception{
//		return ;
//	}
//	@Override
//	public List<Report> selectRList(int, int) thorws Exception{
//		return ;
//	}
	
//	//신고 댓글 삭제 lo
//	@Override
//	public int reportDelete(int) throws Exception{
//		return;
//	}
	
}
