package kh.project.stayfit.health.model.service;

import java.util.List;

import kh.project.stayfit.health.model.vo.HealthCenter;

public interface HealthCenterService {
	
	// 게시글 목록 조회, 글 검색
	public List<HealthCenter> selectCenterlist(int lid, String search, String keyword, int page, int limits) throws Exception;
	
	// 게시글 총 개수
	public int totalPageCnt(String search, String keyword) throws Exception;
}
