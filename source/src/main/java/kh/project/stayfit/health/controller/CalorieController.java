package kh.project.stayfit.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.health.model.vo.HealthInfoForCalorie;

@Controller
@RequestMapping("/health")
public class CalorieController {
	
	// calorie 정보 입력
	@GetMapping("/caloriewrite")
	public ModelAndView calorieWrite(ModelAndView mv) {
		
		mv.addObject("sectionName", "health/caloriewrite.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	// calorie 정보 출력
	@PostMapping("/calorielist")
	public ModelAndView calorieList(ModelAndView mv
			, HealthInfoForCalorie healthInfoVo) {
		
		mv.addObject("healthInfoVo", healthInfoVo);
		mv.addObject("sectionName", "health/calorielist.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
