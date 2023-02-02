package kh.project.stayfit.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/list")
	public ModelAndView boardGet(ModelAndView mv) {
		
		mv.addObject("sectionName", "board/list.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/read")
	public ModelAndView boardRead(ModelAndView mv) {
		
		mv.addObject("sectionName", "board/read.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
