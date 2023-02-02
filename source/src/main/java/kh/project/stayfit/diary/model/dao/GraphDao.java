package kh.project.stayfit.diary.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.project.stayfit.diary.model.vo.Diary;

@Repository
public class GraphDao {
	@Autowired
	private SqlSession sqlsession;
	
	//그래프 출력
	public List<Diary> selectList(int a , String b)  throws Exception {
		return null;
		
	}
}
