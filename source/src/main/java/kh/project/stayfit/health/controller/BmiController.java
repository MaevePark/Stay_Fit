package kh.project.stayfit.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/health")
public class BmiController {
	
	@GetMapping("/bmiwrite")
	public ModelAndView bmiWrite(ModelAndView mv) {
		
		mv.addObject("sectionName", "health/bmiwrite.jsp");
		mv.setViewName("index");
		
		return mv;
	}
//	@GetMapping("/bmilist")
//	public ModelAndView bmiResult(ModelAndView mv) {
//		
//		mv.addObject("sectionName", "health/bmilist.jsp");
//		mv.setViewName("index");
//		
//		return mv;
//	}
}
