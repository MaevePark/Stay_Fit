package kh.project.stayfit.member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class LogoutController {
	
	@PostMapping("/member/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.addObject("sectionName", "main.jsp");
		mv.setViewName("index");
		return mv;
	}
	
}
