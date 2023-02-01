package kh.project.stayfit.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")
public class BoardController {

	@GetMapping("/notice")
	public ModelAndView boardGet(ModelAndView mv) {
		
		mv.addObject("sectionName", "board/notice.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
