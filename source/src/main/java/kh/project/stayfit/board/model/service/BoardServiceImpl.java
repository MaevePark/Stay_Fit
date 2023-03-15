package kh.project.stayfit.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.board.model.dao.BoardDao;
import kh.project.stayfit.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao dao;

	// 게시글 페이지, 글검색
	@Override
	public List<Board> boardlist(int bcid, String search, String keyword, int page, int limits) throws Exception {
		return dao.boardlist(bcid, search, keyword, page, limits);
	}

	// 게시글 총 갯수
	@Override
	public int totalCnt(int bcid, String search, String keyword) {
		return dao.totalCnt(bcid, keyword, keyword);
	}

	// 게시글 read 상세페이지
	@Override
	public Board read(int bid) throws Exception {
		return dao.read(bid);
	}

	// 게시글 조회수 증가
	@Override
	public int bvcupdate(int bid) throws Exception {
		int bvcount = dao.bvcupdate(bid);
		return bvcount;
	}

	// 게시글 등록
	@Override
	public int write(Board vo) throws Exception {
		return dao.write(vo);
	}

	// 게시글 수정
	@Override
	public int update(Board vo) throws Exception {
		return dao.update(vo);
	}

	// 게시글 삭제
	@Override
	public int bdelete(int bid) throws Exception {
		return dao.bdelete(bid);
	}

	// 북마크 카운트
	@Override
	public int checkbook(int mid, int bid) throws Exception {
		int count = dao.checkbook(mid, bid);
		return count;
	}

	// 북마크
	@Override
	public int book(int mid, int bid) throws Exception {
		return dao.book(mid, bid);
	}

	// 북마크 취소
	@Override
	public int delbook(int mid, int bid) throws Exception {
		return dao.delbook(mid, bid);
	}

//	//게시글 반응
//	@Override
//	public int emotion(int ,int ,int ) throws Exception{
//		return ;
//	}

}
