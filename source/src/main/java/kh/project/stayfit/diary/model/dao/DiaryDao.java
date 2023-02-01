package kh.project.stayfit.diary.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DiaryDao {
	@Autowired
	private SqlSession sqlSession;
}
