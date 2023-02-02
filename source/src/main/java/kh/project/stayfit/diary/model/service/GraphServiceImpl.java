package kh.project.stayfit.diary.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.diary.model.dao.GraphDao;
import kh.project.stayfit.diary.model.vo.Diary;

@Service
public class GraphServiceImpl implements GraphService {
	@Autowired
	private GraphDao dao;
	
	//그래프 출력
	@Override
	public List<Diary> selectList(int a, String b) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
}
