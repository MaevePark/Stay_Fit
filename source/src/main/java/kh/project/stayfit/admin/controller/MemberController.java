package kh.project.stayfit.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.project.stayfit.admin.model.service.AdminMemberService;
import kh.project.stayfit.admin.model.vo.AdminMember;

@Controller
@RequestMapping("/admin")
public class MemberController {
	
	@Autowired
	private AdminMemberService service;
	
	
	@GetMapping("/member")
	public ModelAndView member(ModelAndView mv) {
		
		mv.addObject("currentMenu", 2);
		mv.setViewName("/admin/member");
		
		return mv;
	}
	
	// 목록 출력
	@GetMapping("/memberlist")
	@ResponseBody
	public String selectMember() throws Exception {

		List<AdminMember> list = service.selectMember();

		return new Gson().toJson(list);
	}
}
