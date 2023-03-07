package kh.project.stayfit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.member.model.service.MemberService;

@Controller
@RequestMapping
public class LogoutController {
	
	@Autowired
	MemberService memberService;
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mv = new ModelAndView();
		mv.addObject("sectionName", "main.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
