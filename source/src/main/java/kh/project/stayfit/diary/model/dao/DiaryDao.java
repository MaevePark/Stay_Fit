package kh.project.stayfit.diary.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.diary.model.vo.Diary;
import kh.project.stayfit.diary.model.vo.Exercise;
import kh.project.stayfit.diary.model.vo.Nutrition;

@Repository
public class DiaryDao {
	@Autowired
	private SqlSession sqlsession;
	
	//캘린더 작성
	public int diarywrite(Diary diary) throws Exception {  // insert(??)
		
		return sqlsession.insert("diary.diarywirte", diary);	
	}
	public List<Nutrition> searchMeal(String keyword){
		System.out.println("-------------------Dao---------------------");
		System.out.println("keyword : " + keyword);
		return sqlsession.selectList("diary.searchMeal", keyword);
	}
	public List<Exercise>searchExrc(String keyword){
		System.out.println("-------------------Dao---------------------");
		System.out.println("keyword : " + keyword);
		return sqlsession.selectList("diary.searchExrc", keyword);
	}
	//캘린더 출력
	public List<Diary> selectList(Map<String, Object> dataMap) throws Exception {
		return sqlsession.selectList("diary.diaryList", dataMap);
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
