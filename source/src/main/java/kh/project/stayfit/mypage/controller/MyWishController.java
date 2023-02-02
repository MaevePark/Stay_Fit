package kh.project.stayfit.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MyWishController {
	
	@GetMapping("/mywish")
	public ModelAndView myWish(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/mywish.jsp");
		mv.setViewName("index");
		
		return mv;
	}

}
