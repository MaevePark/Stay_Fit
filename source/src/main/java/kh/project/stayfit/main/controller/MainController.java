package kh.project.stayfit.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.main.service.MainService;

@Controller
public class MainController {
	@Autowired
	private MainService srv;

	@GetMapping({ "/", "/main", "/index" })
	public ModelAndView mainPage(ModelAndView mv) throws Exception {
		//공지사항
		List<Board> nolist = srv.notice();
		mv.addObject("notice", nolist);
		//인기글
		List<Board> popular = srv.popular();
		mv.addObject("popular", popular);
		//최신글
		List<Board> recent = srv.recent();
		mv.addObject("recent", recent);
		
		mv.addObject("sectionName", "main.jsp");
		mv.setViewName("index");
		return mv;
	}
}
