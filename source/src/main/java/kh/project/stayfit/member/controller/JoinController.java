package kh.project.stayfit.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping
public class JoinController {

	@GetMapping("/join")
	public ModelAndView join(ModelAndView mv) {
		
		mv.addObject("sectionName", "회원가입.jsp");
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
