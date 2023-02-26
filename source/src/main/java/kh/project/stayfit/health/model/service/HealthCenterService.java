package kh.project.stayfit.health.model.service;

import java.util.List;

import kh.project.stayfit.health.model.vo.HealthCenter;

public interface HealthCenterService {
	
	//보건소 list 목록 출력
	public List<HealthCenter> selectList() throws Exception;
}
