package kh.project.stayfit.diary.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping
public class DiaryController {
	@GetMapping("/diary")
	public ModelAndView diary(ModelAndView mv) {
		
		mv.addObject("sectionName", "diary/diarypage.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
