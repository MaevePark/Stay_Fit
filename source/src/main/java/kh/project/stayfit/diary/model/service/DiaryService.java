package kh.project.stayfit.diary.model.service;

import java.util.List;

import kh.project.stayfit.diary.model.vo.Diary;

public interface DiaryService {
	//캘린더 작성
	public int insert() throws Exception; // insert(??)
	//캘린더 출력
	public List<Diary> selectList(String a, int b) throws Exception; // select(String, int): List<Diary>
	//캘린더 수정
	public int update(String a, int b, int c) throws Exception; // update(String, int, 수정한 파라미터): int
	//캘린더 삭제
	public int delete(String a, int b) throws Exception; // delete(String, int): int
	
}
