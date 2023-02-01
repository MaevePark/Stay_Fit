package kh.project.stayfit.main.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MainController {
	
	@GetMapping({"/", "/main", "/index"})
	public ModelAndView mainPage(ModelAndView mv) {
		
		mv.addObject("sectionName", "main.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
}
