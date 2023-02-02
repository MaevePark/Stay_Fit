package kh.project.stayfit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.admin.model.service.DashboardService;

@Controller
@RequestMapping("/admin")
public class DashboardController {
	
	@Autowired
	private DashboardService service;
	
	
	@GetMapping("/dashboard")
	public ModelAndView dashboard(ModelAndView mv) {
		
		mv.addObject("currentMenu", 1);
		mv.setViewName("/admin/dashboard");
		
		return mv;
	}
}
