package kh.project.stayfit.board.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.board.model.dao.BoardDao;

@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao dao;
	
//	//커뮤니티 글목록 페이지,페이징
//	@Override
//	public List<Board> selectList(int, int) throws Exception{
//		return ;
//	}
//	@Override
//	public int selectTotalCnt() throws Exception{
//		return ;
//	}
		
//	//게시판 글 등록
//	@Override
//	public int write(Board) throws Exception{
//		return ;
//	}
	
//	//게시판 글 검색, 페이징
//	@Override
//	public List<Board> selectList(int ,int , String ) throws Exception{
//		return ;
//	}
//	@Override
//	public int selectTotalCnt(String) throws Exception{
//		return ;
//	}
	
//	//게시글 수정
//	@Override
//	public int update(Board ) throws Exception{
//		return ;
//	}
	
//	//게시글 삭제
//	@Override
//	public int delete(int) throws Exception{
//		return ;
//	}
	
//	//게시글 상세페이지
//	@Override
//	public List<Board> read(int ) throws Exception{
//		return ;
//	}
//	@Override
//	public List<Reply> seletList(int) throws Exception{
//		return ;
//	}
	
//	//게시글 북마크
//	@Override
//	public int bmark(int ,String , ???) throws Exception{
//		return ;
//	}

//	//게시글 반응
//	@Override
//	public int emotion(int ,int ,int ) throws Exception{
//		return ;
//	}

}
