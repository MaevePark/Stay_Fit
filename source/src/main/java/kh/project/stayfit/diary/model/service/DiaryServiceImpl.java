package kh.project.stayfit.diary.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.diary.model.dao.DiaryDao;

@Service
public class DiaryServiceImpl implements DiaryService {
	@Autowired
	private DiaryDao dao;
	
	//override -mjpark
}
