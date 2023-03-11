package kh.project.stayfit.member.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.member.model.service.MemberMailService;
import kh.project.stayfit.member.model.service.MemberService;
import kh.project.stayfit.member.model.vo.Member;

@Controller
@RequestMapping("/member")
public class JoinController {
	@Autowired
	private JavaMailSender mailSender;
	@Autowired
	MemberService memberService;
	@Autowired
	MemberMailService mailService;
	
	@GetMapping("/join")
	public ModelAndView join(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/join.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/join")
	public String join(Member member) {
		memberService.join(member);
		return "redirect:/member/login";
	}
	
	@GetMapping("/pwfind")
	public ModelAndView pwfind(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/pwfind.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@GetMapping("/mailchk")
	@ResponseBody
	public String mailchk(@RequestParam(name="memail") String memail) {
		System.out.println("이메일 인증 요청 들어옴");
		System.out.println("이메일 인증 이메일 : " + memail);
		return mailService.EmailForm(memail);
	}
	@RequestMapping("/send")
	public void sendMail() {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("limskyu@naver.com");
		message.setSubject("회원 가입 인증 이메일 입니다.");
		message.setText("홈페이지를 방문해주셔서 감사합니다.");
		mailSender.send(message);
	}
	@GetMapping("/codechk")
	public ModelAndView codechk(ModelAndView mv) {
		
		mv.addObject("sectionName", "코드체크.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
