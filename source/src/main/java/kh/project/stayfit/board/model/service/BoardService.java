package kh.project.stayfit.board.model.service;

import java.util.List;

import kh.project.stayfit.board.model.vo.Board;

public interface BoardService {
	
	//게시판 list페이지 글목록 출력
	public List<Board> boardlist() throws Exception;
	//게시글 read 상세피이지
	public Board read(int bid) throws Exception;
	//게시글 조회수 증가
	public int bvcupdate(int bid) throws Exception;
	//게시글 삭제
	public int bdelete(int bid) throws Exception;
	
//	//커뮤니티 글목록 페이지,페이징
//	public List<Board> selectList(int, int) throws Exception;
//	public int selectTotalCnt() throws Exception;
	
//	//게시판 글 등록
//	public int write(Board) throws Exception;

//	//게시판 글 검색, 페이징
//	public List<Board> selectList(int ,int , String ) throws Exception;
//	public int selectTotalCnt(String) throws Exception;

//	//게시글 수정
//	public int update(Board ) throws Exception;

//	//게시글 삭제
//	public int delete(int) throws Exception;
	
//	//게시글 상세페이지
//	public List<Board> read(int ) throws Exception;
//	public List<Reply> seletList(int) throws Exception;

//	//게시글 북마크
//	public int bmark(int ,String , ???) throws Exception;
	
//	//게시글 반응
//	public int emotion(int ,int ,int ) throws Exception;
	
}
