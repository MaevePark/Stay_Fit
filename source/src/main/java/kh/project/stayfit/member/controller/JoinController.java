package kh.project.stayfit.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.member.model.service.MemberService;
import kh.project.stayfit.member.model.vo.Member;

@Controller
@RequestMapping("/member/*")
public class JoinController {
	
	@Autowired
	MemberService memberService;
	
	@RequestMapping(value="join", method = RequestMethod.GET)
	public ModelAndView join(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/join.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/pwfind")
	public ModelAndView pwfind(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/pwfind.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@GetMapping("/mailchk")
	public ModelAndView mailchk(ModelAndView mv) {
		
		mv.addObject("sectionName", "메일체크.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@GetMapping("/codesend")
	public ModelAndView codesend(ModelAndView mv) {
		
		mv.addObject("sectionName", "코드보내기.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@GetMapping("/codechk")
	public ModelAndView codechk(ModelAndView mv) {
		
		mv.addObject("sectionName", "코드체크.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
