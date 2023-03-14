package kh.project.stayfit.health.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.health.model.dao.HealthCenterDao;
import kh.project.stayfit.health.model.vo.HealthCenter;


@Service
public class HealthCenterServiceImpl implements HealthCenterService {
	
	@Autowired
	private HealthCenterDao dao;
	
	// 게시글 목록 조회, 글 검색
	@Override
	public List<HealthCenter> selectCenterlist(int lid, String category, String keyword, int page, int limits) throws Exception {
		return dao.selectCenterlist(lid, category, keyword, page, limits);
	}
	
	// 게시글 총 개수
	@Override
	public int totalPageCnt(int lid, String category, String keyword) throws Exception {
		return dao.totalPageCnt(lid, category, keyword);
	}
}
