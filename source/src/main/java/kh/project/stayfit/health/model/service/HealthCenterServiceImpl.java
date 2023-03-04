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
	
	// 게시글 목록 조회
	@Override
	public List<HealthCenter> selectCenter(int lid) throws Exception {
		return dao.selectCenter(lid);
	}
}
