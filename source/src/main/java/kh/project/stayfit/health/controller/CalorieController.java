package kh.project.stayfit.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.health.model.vo.HealthInfoForCalorie;

@Controller
@RequestMapping("/health")
public class CalorieController {
	
	@GetMapping("/caloriewrite")
	public ModelAndView calorieWrite(ModelAndView mv) {
		
		mv.addObject("sectionName", "health/caloriewrite.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/calorielist")
	public ModelAndView calorielist(ModelAndView mv
			, HealthInfoForCalorie healthInfoVo) {
		
		mv.addObject("healthInfoVo", healthInfoVo);
		mv.addObject("sectionName", "health/calorielist.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
