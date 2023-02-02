package kh.project.stayfit.mypage.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyReplyDao {
	@Autowired
	private SqlSession sqlsession;
	
	//공감 댓글 호출
//	public List<LikeReply> selectLikeReplyList(댓글ID, 회원ID, 검색어) throws Exception {
//		return null;
//	} //selectLikeReplyList(댓글ID, 회원ID, 검색어): List<LikeReply> - 담당자가 수정
//	public int selectTotalCnt(int a, int b, String c) throws Exception {
//		return 0;
//	}
	//작성한 댓글 호출
//	public List<Reply> selectReplyList(int a, String b) throws Exception {
//		return null;
//	}
//	public int selectTotalCnt(int a, String b) throws Exception {
//		return 0;
//	}
}
