package kh.project.stayfit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/admin")
public class MemberController {
	
	
	@GetMapping("/member")
	public ModelAndView member(ModelAndView mv) {
		
		mv.addObject("currentMenu", 2);
		mv.setViewName("/admin/member");
		
		return mv;
	}
}
