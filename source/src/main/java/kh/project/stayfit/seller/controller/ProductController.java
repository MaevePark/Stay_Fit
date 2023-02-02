package kh.project.stayfit.seller.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.seller.model.service.ProductService;

@Controller
@RequestMapping("/seller")
public class ProductController {
	
	@Autowired
	private ProductService service;
	
	
	@GetMapping("/product")
	public ModelAndView product(ModelAndView mv) {
		
		mv.addObject("currentMenu", 1);
		mv.setViewName("/seller/product");
		
		return mv;
	}
	
	@GetMapping("/form")
	public ModelAndView form(ModelAndView mv) {
		
		mv.addObject("currentMenu", 2);
		mv.setViewName("/seller/form");
		
		return mv;
	}
}
