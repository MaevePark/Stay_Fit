package kh.project.stayfit.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.member.model.service.MemberService;
import kh.project.stayfit.member.model.vo.Member;


@Controller
@RequestMapping("/member")
public class LoginController {
	
	@Autowired
	MemberService memberService;
	
	//로그인 화면
	@GetMapping("/login")
	public ModelAndView login(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/login.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/login")
	public ModelAndView loginCheck(@ModelAttribute Member member, HttpSession session) {
		boolean result = memberService.loginCheck(member, session);
		ModelAndView mv = new ModelAndView();
		if(result == true) { //로그인 성공
			mv.addObject("sectionName", "main.jsp");
			mv.setViewName("index");	
		}else { 			//로그인 실패
			mv.addObject("sectionName", "member/login.jsp");
			mv.setViewName("index");
			mv.addObject("msg", "아이디 또는 비밀번호를 확인해주세요.");
		}
		return mv;
	}
	
	@GetMapping("/naverlogin")
	public String naverLogin() {
		return "naverlogin";
	}
}
