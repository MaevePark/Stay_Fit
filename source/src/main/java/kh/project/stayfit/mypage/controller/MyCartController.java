package kh.project.stayfit.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MyCartController {

	
	@GetMapping("/mycart")
	public ModelAndView myCart(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/mycart.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
