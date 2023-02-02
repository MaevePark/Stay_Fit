package kh.project.stayfit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.admin.model.service.AdminProductService;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	@Autowired
	private AdminProductService service;
	
	
	@GetMapping("/product")
	public ModelAndView product(ModelAndView mv) {
		
		mv.addObject("currentMenu", 3);
		mv.setViewName("/admin/product");
		
		return mv;
	}
}