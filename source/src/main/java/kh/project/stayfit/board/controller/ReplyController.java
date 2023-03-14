package kh.project.stayfit.board.controller;

import java.net.CacheResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.project.stayfit.board.model.service.ReplyService;
import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.board.model.vo.Reply;

@Controller
@RequestMapping("/board")
public class ReplyController {
	@Autowired
	private ReplyService srv;

	// 부모 댓글 작성
	@PostMapping("/replywrite")
	@ResponseBody
	public String write(@RequestBody Reply vo) throws Exception {
		srv.write(vo);
		return new Gson().toJson(vo);
	}
	
	// 자식 댓글 작성
	@PostMapping("/childwrite")
	@ResponseBody
	public String cwrite(@RequestBody Reply vo) throws Exception {
		srv.cwrite(vo);
		return new Gson().toJson(vo);
	}

	// 댓글 수정
	@PostMapping("/replyupdate")
	@ResponseBody
	public String rupdate(@RequestBody Reply vo) throws Exception {
		srv.update(vo);
		return new Gson().toJson(vo);
	}

	// 댓글 삭제
	@PostMapping("/replydelete")
	@ResponseBody
	public int delete(@RequestParam("rid") int rid) throws Exception {
		return srv.delete(rid);
	}

	// 댓글 공감
	@PostMapping("/like")
	@ResponseBody
	public Map<String, String> like(@RequestParam("rid") int rid, HttpSession session) throws Exception {

		int mid = (int) session.getAttribute("mid"); // 세션에서 회원번호 가져오기

		int count = srv.checklike(rid, mid); // 해당 댓글에 대한 회원의 좋아요 상태 확인
		Map<String, String> map = new HashMap<>();

		if (count == 0) { // 좋아요를 누르지 않은 경우
			srv.like(rid, mid); // 좋아요 추가
			map.put("result", "success");
			map.put("action", "like");
		} else { // 좋아요를 이미 누른 경우
			srv.unlike(rid, mid); // 좋아요 제거
			map.put("result", "success");
			map.put("action", "unlike");
		}
		return map;
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

//	@PostMapping("/replyreport")
//	public ModelAndView report(ModelAndView mv) {
////		Board bone = srv.read(bid);
//
//		mv.addObject("sectionName", "board/read.jsp");
////		mv.addObject("read", bone);
//		mv.setViewName("index");
//
//		return mv;
//	}

//
//	@PostMapping("/replyadopt")
//	public ModelAndView adopt(ModelAndView mv) {
////		Board bone = srv.read(bid);
//
//		mv.addObject("sectionName", "board/read.jsp");
////		mv.addObject("read", bone);
//		mv.setViewName("index");
//
//		return mv;
//	}

}
