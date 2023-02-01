package kh.project.stayfit.diary.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.diary.model.dao.DiaryDao;
import kh.project.stayfit.diary.model.dao.GraphDao;

@Service
public class DiaryServiceImpl implements DiaryService {
	@Autowired
	private DiaryDao dao;
	@Autowired
	private GraphDao gDao;
	
	//override -mjpark
}
