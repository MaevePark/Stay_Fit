package kh.project.stayfit.member.controller;


import java.io.PrintWriter;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

import com.google.gson.GsonBuilder;

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
	@Autowired
	Member member;
	
	@GetMapping("/join")
	public ModelAndView join(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/join.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/joinAction")
	public String join(
			HttpServletRequest request
			, @RequestParam(name="memail") String memail
			, @RequestParam(name="mname") String mname
			, @RequestParam(name="mpw") String mpw
			
			) {
		Member vo = new Member();
		System.out.println("----------------------------------------------------------------------");
		System.out.println("memail : "+memail);
		System.out.println("mname : "+mname);
		System.out.println("mpw : "+mpw);
		
		
		vo.setMemail(memail);
		vo.setMname(mname);
		vo.setMpw(mpw);
		System.out.println("Controler Join");
		memberService.join(vo);
		return "redirect:/member/login";
	}
	
	@GetMapping("/pwfind")
	public ModelAndView pwfind(ModelAndView mv) {
		
		mv.addObject("sectionName", "member/pwfind.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@PostMapping("/sendpw")
	public void sendPw(HttpServletResponse response, @RequestParam(name="email1") String memail) {
		memberService.pwfind(response, member);
		String result = null;
		int newPw;
		Random r = new Random();
		int pwNum = r.nextInt(88888888) + 11111111;
		System.out.println("새 비밀번호 : " + pwNum);
		newPw = pwNum;
		try {
			PrintWriter out = response.getWriter();
			try {
				SimpleMailMessage message = new SimpleMailMessage();
				message.setTo(memail);
				message.setSubject("STAYFIT 회원 임시 비밀번호 입니다.");
				message.setText("STAYFIT을 방문해주셔서 감사합니다.\n \n" +
						"새 비밀번호는 " + newPw + " 입니다. \n \n" + 
						"해당 비밀번호로 STAYFIT에 로그인하실 수 있습니다. \n \n" +
						"계정의 보안을 위해 로그인 후 새로운 비밀번호로 변경하시길 바랍니다.");
				mailSender.send(message);
				result = Integer.toString(newPw);
			} catch (Exception e) {
				result = "fail";
			}
			out.append(new GsonBuilder().create().toJson(result));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("result : "+result);
	}
	@PostMapping("/mailChk")
	@ResponseBody
	public int mailchk(@RequestParam("memail") String memail) {
		int result= memberService.mailChk(memail);
		return result; 
	}
	
	@PostMapping("/send")
	public void sendMail(HttpServletResponse response, @RequestParam(name="memail") String memail) {
		String result = null;
		int authNum;
		Random r = new Random();
		int cdNum = r.nextInt(888888) + 111111;
		System.out.println("인증번호 : " + cdNum);
		authNum = cdNum;
		try {
			PrintWriter out = response.getWriter();
			try {
				SimpleMailMessage message = new SimpleMailMessage();
				message.setTo(memail);
				message.setSubject("STAYFIT 회원 가입 인증 이메일 입니다.");
				message.setText("STAYFIT을 방문해주셔서 감사합니다.\n \n" +
						"인증 번호는 " + authNum + " 입니다. \n \n" + 
						"해당 인증번호를 인증번호 확인란에 기입하여 주세요.");
				mailSender.send(message);
				result = Integer.toString(authNum);
			} catch (Exception e) {
				result = "fail";
			}
			out.append(new GsonBuilder().create().toJson(result));
		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("result : "+result);
	}
	@GetMapping("/codechk")
	public ModelAndView codechk(ModelAndView mv) {
		
		mv.addObject("sectionName", "코드체크.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
