package kh.project.stayfit.diary.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.diary.model.vo.Diary;

@Repository
public class DiaryDao {
	@Autowired
	private SqlSession sqlsession;
	
	//캘린더 작성
	public int diarywirte(Diary diary) throws Exception {  // insert(??)
		
		return sqlsession.insert("diary.diarywirte", diary);	
	}
	//캘린더 출력
	public List<Diary> selectList(String a, int b) throws Exception {
		return null;
	}
	//캘린더 수정
	public int update(String a, int b, int c) throws Exception {
		return 0;
	}
	//캘린더 삭제
	public int delete(String a, int b) throws Exception {
		return 0;
	}
}
