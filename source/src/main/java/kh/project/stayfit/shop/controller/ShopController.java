package kh.project.stayfit.shop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/shop")
public class ShopController {
	
	@GetMapping({"", "/", "/main"})
	public ModelAndView shopMainPage(ModelAndView mv) {
		mv.addObject("sectionName", "shop/main.jsp");
		mv.setViewName("index");
		return mv;
	}
}
