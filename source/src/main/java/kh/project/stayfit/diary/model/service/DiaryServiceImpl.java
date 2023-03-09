package kh.project.stayfit.diary.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.diary.model.dao.DiaryDao;
import kh.project.stayfit.diary.model.vo.Diary;

@Service
public class DiaryServiceImpl implements DiaryService {
	@Autowired
	private DiaryDao dao;
	
	//캘린더 작성
	@Override
	public int diarywirte(Diary diary) throws Exception {
		return dao.diarywirte(diary);
	}
	//캘린더 출력
	@Override
	public List<Diary> selectList(String a, int b) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	//캘린더 수정
	@Override
	public int update(String a, int b, int c) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//캘린더 삭제
	@Override
	public int delete(String a, int b) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}


}
