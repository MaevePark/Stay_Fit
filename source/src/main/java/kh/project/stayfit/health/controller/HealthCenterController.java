package kh.project.stayfit.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class HealthCenterController {
	
	@GetMapping("/healthcenter")
	public ModelAndView healthCenter(ModelAndView mv) {
		
		mv.addObject("sectionName", "보건소.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
