package kh.project.stayfit.member.controller;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/member")
public class LogoutController {
	
	@RequestMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		session.invalidate();
		ModelAndView mv = new ModelAndView();
		mv.addObject("sectionName", "main.jsp");
		mv.setViewName("index");
		return mv;
	}
	
}
