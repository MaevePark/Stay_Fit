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
		List<Board> blist = srv.boardlist();
		m.addAttribute("sectionName", "board/list.jsp");
		m.addAttribute("boardlist", blist);
		return "index";
		
	}
	//게시글 read 상세페이지
	@GetMapping("/read.do")
	public String read(Model m, int bid) throws Exception {
		//상세보기
		Board bone = srv.read(bid);
		//조회수 증가
		int bvcount= srv.bvcupdate(bid);
		m.addAttribute("sectionName", "board/read.jsp");
		m.addAttribute("read", bone);
		return "index";
	}
	
	@GetMapping("/read")
	public ModelAndView boardRead(ModelAndView mv) {
		
		mv.addObject("sectionName", "board/read.jsp");
		mv.setViewName("index");
		
		return mv;
	}
}
