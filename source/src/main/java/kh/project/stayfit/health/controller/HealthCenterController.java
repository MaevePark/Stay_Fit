package kh.project.stayfit.health.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.health.model.service.HealthCenterService;
import kh.project.stayfit.health.model.vo.HealthCenter;

@Controller
@RequestMapping("/health")
public class HealthCenterController {

	@Autowired
	private HealthCenterService service;
	
	// 게시글 목록 조회
	@GetMapping("/centerlist")
	public ModelAndView selectCenterList(ModelAndView mv, 
			@RequestParam(name = "lid", defaultValue = "0") int lid) throws Exception {
		
		List<HealthCenter> list = service.selectCenter(lid);
		
		mv.addObject("centerList", list);
		mv.addObject("sectionName", "health/centerlist.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
