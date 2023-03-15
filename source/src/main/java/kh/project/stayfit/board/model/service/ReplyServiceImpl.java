package kh.project.stayfit.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.board.model.dao.ReplyDao;
import kh.project.stayfit.board.model.vo.Reply;

@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	private ReplyDao dao;

	// 댓글 조회
	@Override
	public List<Reply> replylist(int bid) throws Exception {
		List<Reply> rlist = dao.replylist(bid);
		return rlist;
	}
	
	//댓글 list 갯수
	@Override
	public int rtotalCnt(int bid) throws Exception{
		return dao.rtotalCnt(bid);
	}

	// 부모 댓글 작성
	@Override
	public int write(Reply vo) throws Exception {
		return dao.write(vo);
	}
	// 자식 댓글 작성
	@Override
	public int cwrite(Reply vo) throws Exception {
		return dao.cwrite(vo);
	}

	// 댓글 수정
	@Override
	public int update(Reply vo) throws Exception {
		return dao.update(vo);
	}

	// 댓글 삭제
	@Override
	public int delete(int rid) throws Exception {
		return dao.delete(rid);
	}

	// 댓글 좋아요 카운트
	@Override
	public int checklike(int rid, int mid) throws Exception {
		int count = dao.checklike(rid, mid);
		return count;
	}

	// 댓글 좋아요
	@Override
	public int like(int rid, int mid) throws Exception {
		return dao.like(rid, mid);
	}

	// 댓글 좋아요 삭제
	@Override
	public int unlike(int rid, int mid) throws Exception {
		return dao.unlike(rid, mid);
	}

	//북마크 카운트
	@Override
	public int checkbook(int mid, int bid) throws Exception {
		int count = dao.checkbook(mid, bid);
		return count;
	}

	//북마크
	@Override
	public int book(int mid, int bid) throws Exception {
		return dao.book(mid, bid);
	}

	//북마크 취소
	@Override
	public int delbook(int mid, int bid) throws Exception {
		return dao.delbook(mid, bid);
	}
	
	//댓글 신고
	@Override
    public int report(int mid, int rid, int repid) {
        return dao.report(mid, rid, repid);
    }

//	//답변 선택
//	@Override
//	public int adopt(int, int, int, int) throws Exception{
//		return ;
//	}

}
