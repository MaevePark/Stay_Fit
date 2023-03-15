package kh.project.stayfit.board.model.service;

import java.util.List;

import kh.project.stayfit.board.model.vo.Board;

public interface BoardService {

	// 게시글 페이징, 글검색, 글출력
	public List<Board> boardlist(int bcid, String search, String keyword, int page, int limits) throws Exception;

	// 게시글 총 갯수
	public int totalCnt(int bcid, String search, String keyword) throws Exception;

	// 게시글 read 상세피이지
	public Board read(int bid) throws Exception;

	// 게시글 조회수 증가
	public int bvcupdate(int bid) throws Exception;

	// 게시글 등록
	public int write(Board vo) throws Exception;

	// 게시글 수정
	public int update(Board vo) throws Exception;

	// 게시글 삭제
	public int bdelete(int bid) throws Exception;

	// 북마크 카운트
	public int checkbook(int mid, int bid) throws Exception;

	// 북마크
	public int book(int mid, int bid) throws Exception;

	// 북마크 취소
	public int delbook(int mid, int bid) throws Exception;


//	//게시글 반응
//	public int emotion(int ,int ,int ) throws Exception;

}
