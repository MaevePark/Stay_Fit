package kh.project.stayfit.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.board.model.service.BoardService;
import kh.project.stayfit.board.model.vo.Board;


@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService srv;

	@GetMapping("/list")
	public String list(Model m) throws Exception {
		List<Board> blist;
		blist = srv.boardlist();
		m.addAttribute("sectionName", "board/list.jsp");
		m.addAttribute("boardlist", blist);
		return "index";
		
	}
	
	@GetMapping("/read")
	public ModelAndView boardRead(ModelAndView mv) {
		
		mv.addObject("sectionName", "board/read.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
