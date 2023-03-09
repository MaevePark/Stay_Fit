package kh.project.stayfit.board.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.project.stayfit.board.model.service.BoardService;
import kh.project.stayfit.board.model.service.ReplyService;
import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.board.model.vo.Reply;
import kh.project.stayfit.common.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService srv;
	@Autowired
	private ReplyService lsrv;
	
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
		// 게시글 상세보기
		Board bone = srv.read(bid);
		List<Reply> rlist = lsrv.replylist(bid);
		// 조회수 증가
		int bvcount = srv.bvcupdate(bid);
		
		int mid = 1; // 임시 user
		mv.addObject("user", mid);
		
		mv.addObject("reply", rlist);
		mv.addObject("sectionName", "board/read.jsp");
		mv.addObject("read", bone);
		mv.setViewName("index");

		return mv;
	}

	//게시글 등록화면
	@GetMapping("/write")
	public ModelAndView writeview(ModelAndView mv) throws Exception{
		
		int mid = 3; //user값 임시 mid=3(일반유저) mid=4(관리자)
		mv.addObject("user", mid);
		
		mv.addObject("sectionName", "board/write.jsp");
		mv.setViewName("index");

		return mv;
	}
	//게시글 등록
	@PostMapping("/write")
	public String write(Board vo) throws Exception {
		srv.write(vo);
		return "redirect:/board/list?bcid="+ vo.getBcid();
	}

	//게시글 수정페이지
	@GetMapping("/update")
	public ModelAndView updateview(ModelAndView mv, @RequestParam("bid") int bid) throws Exception {
		
		mv.addObject("board", srv.read(bid));
		mv.addObject("sectionName", "board/update.jsp");
		mv.setViewName("index");

		return mv;
	}
	
	//게시글 수정
//	@PostMapping("/update")
//	@ResponseBody
//	public String boardupdate(@RequestParam Board vo) throws Exception {
//		System.out.println("게시글 수정>>>>>>>>>>>>>>>>>>>>>>>>>>>>>");
//		System.out.println(vo.toString());
//		vo.setBtitle(vo.getBtitle());
//		vo.setBcontent(vo.getBcontent());
//		vo.setBid(vo.getBid());
//		vo.setBcid(vo.getBcid());
//		srv.update(vo);
//		return "redirect: /board/read?bid="+ vo.getBid();
//	}

	//게시글 삭제
	@PostMapping("/delete")
	@ResponseBody
	public int delete(@RequestParam("bid") int bid) throws Exception {
		int result = srv.bdelete(bid);
		return result;
	}
}
