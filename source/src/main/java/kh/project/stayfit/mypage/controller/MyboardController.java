package kh.project.stayfit.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MyboardController {
	
	@GetMapping("/myboard")
	public ModelAndView myBoard(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myboard.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
}
