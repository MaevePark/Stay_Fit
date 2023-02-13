package kh.project.stayfit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/login.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
