package kh.project.stayfit.main.service;

import java.util.List;

import kh.project.stayfit.board.model.vo.Board;

public interface MainService {
	//공지사항
	public List<Board> notice() throws Exception;
	//인기글
	public List<Board> popular() throws Exception;
	//최신글
	public List<Board> recent() throws Exception;
}
