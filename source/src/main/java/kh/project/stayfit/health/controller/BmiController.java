package kh.project.stayfit.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/health")
public class BmiController {
	
	@GetMapping("/bmimeasure")
	public ModelAndView bmiMeasure(ModelAndView mv) {
		
		mv.addObject("sectionName", "health/bmimeasure.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@GetMapping("/bmiresult")
	public ModelAndView bmiResult(ModelAndView mv) {
		
		mv.addObject("sectionName", "health/bmiresult.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
