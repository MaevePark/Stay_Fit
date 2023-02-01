package kh.project.stayfit.diary.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.diary.model.dao.GraphDao;

@Service
public class GraphServiceImpl implements GraphService {
	@Autowired
	private GraphDao dao;
	
	//override -mjpark
}
