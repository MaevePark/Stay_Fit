package kh.project.stayfit.main.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.main.service.MainService;
import kh.project.stayfit.shop.model.service.ShopService;

@Controller
public class MainController {
	@Autowired
	private MainService srv;
	@Autowired
	private ShopService shopService;

	@GetMapping({ "/", "/main", "/index" })
	public ModelAndView mainPage(ModelAndView mv) throws Exception {
		// 공지사항
		List<Board> nolist = srv.notice();
		mv.addObject("notice", nolist);
		// 인기글
		List<Board> popular = srv.popular();
		mv.addObject("popular", popular);
		// 최신글
		List<Board> recent = srv.recent();
		mv.addObject("recent", recent);

		// 세일품목
		mv.addObject("saleList", shopService.selectSaleList());

		mv.addObject("sectionName", "main.jsp");
		mv.setViewName("index");
		return mv;
	}

	// 오류
	@ExceptionHandler(Exception.class) // 모든 Exception시 여기로
	public ModelAndView exceptionHandler(Exception e /* ModelAndView mv 작성시 오류 발생 */) {
		// 프로젝트초기에는 e.printStackTrace(); 로 로그 봐야함. 나중에 지우기
		e.printStackTrace();
		ModelAndView mv = new ModelAndView();
		mv.addObject("errMsg", e.getMessage());
		mv.setViewName("/AccessDenied");
		return mv;
	}
}
