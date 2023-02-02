package kh.project.stayfit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class LogoutController {
	
	@GetMapping("/logout")
	public ModelAndView healthCenter(ModelAndView mv) {
		
		mv.addObject("sectionName", "로그아웃.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
