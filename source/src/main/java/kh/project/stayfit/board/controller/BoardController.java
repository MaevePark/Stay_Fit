package kh.project.stayfit.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
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

	// 글목록 출력
//	@GetMapping("/list")
//	public ModelAndView boardlist(ModelAndView mv) throws Exception {
////		List<Board> blist = srv.boardlist(bcid);
//		mv.addObject("sectionName", "board/list.jsp");
////		mv.addObject("boardlist", blist);
//		mv.setViewName("index");
//
//		return mv;
//	}
	// 게시판링크
//	@GetMapping(value = {"","/"})
//	public String boardlist(int bcid, String search, String keyword, int page, int limits) throws Exception {
//		List<Board> searchlist = srv.boardlist(bcid, search, keyword, page, limits);
//		return "redirect: /list?bcid";
//	}

	// 글목록 출력(검색추가)
//	@GetMapping(value = {"/list","/listsearch"})
//	@ResponseBody
//	public ModelAndView list(ModelAndView mv ,@RequestParam(name = "bcid", defaultValue = "0") int bcid,
//			@RequestParam(name = "search", required=false, defaultValue = "") String search,
//			@RequestParam(name = "keyword", required=false, defaultValue = "") String keyword) throws Exception {
//		List<Board> searchlist = srv.boardlist(bcid, search, keyword);
//		
//		mv.addObject("boardlist", searchlist);
//		mv.addObject("sectionName", "board/list.jsp");
//		mv.setViewName("index");
//		return mv;
//	}
	
	//글목록 출력 + 검색 + 페이징
	@GetMapping("/list")
	@ResponseBody
	public ModelAndView list(ModelAndView mv , @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "bcid", defaultValue = "") int bcid,
			@RequestParam(name = "search", required=false, defaultValue = "") String search,
			@RequestParam(name = "keyword", required=false, defaultValue = "") String keyword,
			HttpServletRequest request) throws Exception {
		
		int limits = 10;
		int pageLimit = 5;
		int totalCnt = srv.totalCnt(bcid,search,keyword);
		Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
		
		List<Board> searchlist = srv.boardlist(bcid, search, keyword, page, limits);
		
		//세션을 비우기(조회수용)
		HttpSession session = request.getSession();
		session.removeAttribute("s");
		
		mv.addObject("bcid", bcid); 
		mv.addObject("keyword", keyword);
		mv.addObject("search", search);
		mv.addObject("boardlist", searchlist);
		mv.addObject("sectionName", "board/list.jsp");
		mv.addObject("urlpattern", "board/list");
		mv.addObject("pagingMap", pagingMap);
		mv.setViewName("index");
		return mv;
	}


	//게시글 read 상세페이지
	@GetMapping("/read.do")
	public ModelAndView read(ModelAndView mv, int bid, HttpServletRequest request) throws Exception {
		// 게시글 상세보기
		Board bone = srv.read(bid);
		//댓글 리스트
		List<Reply> rlist = lsrv.replylist(bid);
		//댓글 카운트 
		int rCnt = lsrv.rtotalCnt(bid);
		
		//한페이지 새로고침 방지 조회수 증가 session에 s 체크상태인 동시에 조회수 1증가 새로고침해도 조회수 증가 안 함 
		//list로 이동 후 다시 들어가야지 조회수 증가 
		HttpSession session = request.getSession();
		String show = (String)session.getAttribute("s");
		if(show == null) {
			int bvcount = srv.bvcupdate(bid); //조회수 증가
			session.setAttribute("s", "check");
		}
		
		
		if(request.getSession().getAttribute("mid") != null) {
			int mid = (int)request.getSession().getAttribute("mid");
			mv.addObject("writer", mid);
		}
		//댓글에 사용자 이름 출력하기 위해서 사용 
		String loginuser = (String) session.getAttribute("mname");
		mv.addObject("loginuser", loginuser); 
		
		mv.addObject("rCnt", rCnt);  //댓글카운트
		mv.addObject("reply", rlist); 
		mv.addObject("sectionName", "board/read.jsp");
		mv.addObject("read", bone);
		mv.setViewName("index");

		return mv;
	}

	//게시글 등록화면
	@GetMapping("/write")
	public ModelAndView writeview(ModelAndView mv, HttpServletRequest request) throws Exception{
			
		if(request.getSession().getAttribute("mid") != null) {
			int mid = (int)request.getSession().getAttribute("mid");
			mv.addObject("writer", mid);
			mv.addObject("sectionName", "board/write.jsp");
		}
		else {
			mv.addObject("sectionName", "member/login.jsp");
			mv.addObject("urlpattern", "member/login");
		}			
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
	@PostMapping("/update")
	@ResponseBody
	public String boardupdate(@RequestBody Board vo) throws Exception {
		srv.update(vo);
		
		return new Gson().toJson(vo);
	}
	
	//게시글 삭제
	@PostMapping("/delete")
	@ResponseBody
	public int delete(@RequestParam("bid") int bid) throws Exception {
		int result = srv.bdelete(bid);
		return result;
	}
	
	// 북마크
		@PostMapping("/book")
		@ResponseBody
		public Map<String, String> bookmark(HttpSession session, @RequestParam("bid") int bid) throws Exception {

			int mid = (int) session.getAttribute("mid"); // 세션에서 회원번호 가져오기

			int count = srv.checkbook(mid, bid); // 해당 댓글에 대한 회원의 좋아요 상태 확인
			Map<String, String> map = new HashMap<>();

			if (count == 0) { // 좋아요를 누르지 않은 경우
				srv.book(mid,bid); // 좋아요 추가
				map.put("result", "success");
				map.put("action", "book");
			} else { // 좋아요를 이미 누른 경우
				srv.delbook(mid,bid); // 좋아요 제거
				map.put("result", "success");
				map.put("action", "delbook");
			}
			return map;
		}
	//오류
	@ExceptionHandler(Exception.class) // 모든 Exception시 여기로
    public ModelAndView exceptionHandler(Exception e /*ModelAndView mv 작성시 오류 발생*/) {
        // 프로젝트초기에는 e.printStackTrace(); 로 로그 봐야함. 나중에 지우기
        e.printStackTrace();
        ModelAndView mv = new ModelAndView(); 
        mv.addObject("errMsg", e.getMessage());
        mv.setViewName("/AccessDenied");
        return mv;
    }
}
