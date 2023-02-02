package kh.project.stayfit.diary.model.service;

import java.util.List;

import kh.project.stayfit.diary.model.vo.Diary;

public interface GraphService {
	//그래프 출력
	public List<Diary> selectList(int a , String b) throws Exception; // select(int, String): List<Diary>
}
