package kh.project.stayfit.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MyProductController {

	
	@GetMapping("/myproduct")
	public ModelAndView myProduct(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myproduct.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
