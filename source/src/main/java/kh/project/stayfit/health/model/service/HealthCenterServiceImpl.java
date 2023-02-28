package kh.project.stayfit.health.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.project.stayfit.health.model.vo.HealthCenter;


@Service
public class HealthCenterServiceImpl implements HealthCenterService {
	@Autowired
	private HealthCenterService dao;

	@Override
	public List<HealthCenter> selectList() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}


	
	
}
