package kh.project.stayfit.board.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.board.model.service.BoardService;
import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.common.Paging;


@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService srv;
	
	//글목록 출력 + 검색 + 페이징
	@GetMapping(value = {"/list","/listsearch"})
	@ResponseBody
	public ModelAndView list(ModelAndView mv , @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "bcid", defaultValue = "0") int bcid,
			@RequestParam(name = "search", required=false, defaultValue = "") String search,
			@RequestParam(name = "keyword", required=false, defaultValue = "") String keyword) throws Exception {
		
		int limits = 10;
		int pageLimit = 5;
		int totalCnt = srv.totalCnt(bcid,search,keyword);
		Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
		
		List<Board> searchlist = srv.boardlist(bcid, search, keyword, page, limits);
		
		mv.addObject("boardlist", searchlist);
		mv.addObject("sectionName", "board/list.jsp");
		mv.addObject("urlpattern", "board/list");
		mv.addObject("pagingMap", pagingMap);
		mv.setViewName("index");
		return mv;
	}
	
	//게시글 read 상세페이지
	@GetMapping("/read.do")
	public ModelAndView read(ModelAndView mv, int bid) throws Exception {
		//게시글상세보기
		Board bone = srv.read(bid);
		
		//조회수 증가
		int bvcount= srv.bvcupdate(bid);
	
		mv.addObject("sectionName", "board/read.jsp");
		mv.addObject("read", bone);
		mv.setViewName("index");
		
		return mv;
	}

	
	//글등록페이지
	@GetMapping("/write")
	public ModelAndView boardwrite(ModelAndView mv) {
		
		mv.addObject("sectionName", "board/write.jsp");
		mv.setViewName("index");
		
		return mv;
	}

	// 글수정페이지
	@GetMapping("/update")
	public ModelAndView boardupdate(ModelAndView mv) {

		mv.addObject("sectionName", "board/write.jsp");
		mv.setViewName("index");

		return mv;
	}

	// 글삭제
	@PostMapping("/delete")
	@ResponseBody
	public int delete(@RequestParam("bid") int bid) throws Exception {
		int result = srv.bdelete(bid);
		return result;	
	}
}
