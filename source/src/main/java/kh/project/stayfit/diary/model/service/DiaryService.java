package kh.project.stayfit.diary.model.service;

import java.util.List;

import kh.project.stayfit.diary.model.vo.Diary;
import kh.project.stayfit.diary.model.vo.Exercise;
import kh.project.stayfit.diary.model.vo.Nutrition;

public interface DiaryService {
	//캘린더 작성
	public int diarywirte(Diary diary) throws Exception; // insert(??)
	public List<Nutrition> searchMeal(String keyword) throws Exception;

	public List<Exercise> searchExrc(String keyword) throws Exception;
	//캘린더 출력
	public List<Diary> selectList(String a, int b) throws Exception; // select(String, int): List<Diary>
	//캘린더 수정
	public int update(String a, int b, int c) throws Exception; // update(String, int, 수정한 파라미터): int
	//캘린더 삭제
	public int delete(String a, int b) throws Exception; // delete(String, int): int
	
}
