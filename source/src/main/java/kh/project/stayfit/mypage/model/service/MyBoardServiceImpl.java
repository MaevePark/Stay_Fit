package kh.project.stayfit.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.mypage.model.dao.MyBoardDao;

@Service
public class MyBoardServiceImpl implements MyBoardService {
	@Autowired
	private MyBoardDao dao;
	
	@Override
	public List<Map<String, Object>> selectBoardList(
			int mid
			, String type
			, int boardCategory
			, int searchRange
			, String searchword
			, int page
			, int limits
			) throws Exception{
		return dao.selectBoardList(mid, type, boardCategory, searchRange, searchword, page, limits);
	}

	@Override
	public int selectBoardTotalCnt(int mid, String type, int boardCategory, int searchRange, String searchword)
			throws Exception {
		
		return 0;
	}
}
