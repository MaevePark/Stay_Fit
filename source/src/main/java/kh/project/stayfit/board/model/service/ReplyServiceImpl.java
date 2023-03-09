package kh.project.stayfit.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.board.model.dao.ReplyDao;
import kh.project.stayfit.board.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyDao dao;
	
	//댓글 조회
	@Override
	public List<Reply> replylist(int bid) throws Exception {
		List<Reply> rlist = dao.replylist(bid);
		return rlist;
	}
	
//	//댓글 작성
	@Override
	public int write(Reply vo) throws Exception{
		return dao.write(vo);
	}

	//댓글 삭제
	@Override
	public int rdelete(int rid) throws Exception{
		return dao.rdelete(rid);
	}
	
//	//대댓글 작성
//	@Override
//	public int answer(Reply) throws Exception{
//		return ;
//	}

//	//댓글 수정
//	@Override
//	public int update(Reply, int) throws Exception{
//		return ;
//	}


//	//댓글 신고
//	@Override
//	public int report(Reply, int) throws Exception{
//		return ;
//	}

//	//댓글 좋아요
//	@Override
//	public int like(int, int) throws Exception{
//		return ;
//	}

//	//답변 선택
//	@Override
//	public int adopt(int, int, int, int) throws Exception{
//		return ;
//	}
	

}
