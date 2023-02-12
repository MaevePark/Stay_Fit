package kh.project.stayfit.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/health")
public class CalorieController {
	
	@GetMapping("/caloriewrite")
	public ModelAndView calorieWrite(ModelAndView mv) {
		
		mv.addObject("sectionName", "health/caloriewrite.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@GetMapping("/calorielist")
	public ModelAndView calorielist(ModelAndView mv) {
		
		mv.addObject("sectionName", "health/calorielist.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
