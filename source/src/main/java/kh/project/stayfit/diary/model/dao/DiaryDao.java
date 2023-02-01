package kh.project.stayfit.diary.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/")
public class DiaryDao {
	@Autowired
	private SqlSession sqlSession;
}
