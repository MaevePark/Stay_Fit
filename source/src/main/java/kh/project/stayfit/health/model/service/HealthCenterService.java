package kh.project.stayfit.health.model.service;

import java.util.List;

import kh.project.stayfit.health.model.vo.HealthCenter;

public interface HealthCenterService {
	
	// 게시글 목록 조회
	public List<HealthCenter> selectCenter(int lid) throws Exception;
}
