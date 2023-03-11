package kh.project.stayfit.board.controller;

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

import kh.project.stayfit.board.model.service.ReplyService;
import kh.project.stayfit.board.model.vo.Board;
import kh.project.stayfit.board.model.vo.Reply;

@Controller
@RequestMapping("/board")
public class ReplyController {
	@Autowired
	private ReplyService srv;

	//부모 댓글 작성
	@PostMapping("/replywrite")
	@ResponseBody
	public String write(@RequestBody Reply vo) throws Exception {
		srv.write(vo);
		return new Gson().toJson(vo);
	}
	
	//댓글 수정
	@PostMapping("/replyupdate")
	@ResponseBody
	public String rupdate(@RequestBody Reply vo) throws Exception {
		srv.update(vo);
		return new Gson().toJson(vo);
	}
	
	//댓글 삭제
	@PostMapping("/replydelete")
	@ResponseBody
	public int delete(@RequestParam("rid") int rid) throws Exception {
		return srv.delete(rid);
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

//	@PostMapping("/replylike")
//	public ModelAndView like(ModelAndView mv) {
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
