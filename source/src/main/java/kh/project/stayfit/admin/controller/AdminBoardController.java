package kh.project.stayfit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.admin.model.service.AdminBoardService;

@Controller
@RequestMapping("/admin")
public class AdminBoardController {
	
	@Autowired
	private AdminBoardService service;
	
	
	@GetMapping("/board")
	public ModelAndView board(ModelAndView mv) {
		
		mv.addObject("currentMenu", 4);
		mv.setViewName("/admin/board");
		
		return mv;
	}
}