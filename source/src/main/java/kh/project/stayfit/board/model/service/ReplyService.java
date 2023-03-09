package kh.project.stayfit.board.model.service;

import java.util.List;

import kh.project.stayfit.board.model.vo.Reply;

public interface ReplyService {
	
	//댓글 조회
	public List<Reply> replylist(int bid) throws Exception;
	
	//댓글 작성
	public int write(Reply vo) throws Exception;
	
	//댓글 삭제
	public int rdelete(int rid) throws Exception;

//	//대댓글 작성
//	public int answer(Reply) throws Exception;
	
//	//댓글 수정
//	public int update(Reply, int) throws Exception;


//	//댓글 신고
//	public int report(Reply, int) throws Exception;

//	//댓글 좋아요
//	public int like(int, int) throws Exception;

//	//답변 선택
//	public int adopt(int, int, int, int) throws Exception;

}
