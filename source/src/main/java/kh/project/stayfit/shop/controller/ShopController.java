package kh.project.stayfit.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.common.Crawling;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@GetMapping({"", "/", "/main"})
	public ModelAndView shopMainPage(ModelAndView mv) {
		mv.addObject("sectionName", "shop/main.jsp?searchProduct=0");
		mv.setViewName("index");
		return mv;
	}
	
	@GetMapping({"go"})
	public ModelAndView crawl(ModelAndView mv) {
		Crawling.crawl();
		return mv;
	}
}
