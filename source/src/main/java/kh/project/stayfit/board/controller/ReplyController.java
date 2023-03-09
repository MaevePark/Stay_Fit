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

	//¥Ò±€ ¿€º∫
	@PostMapping("/replywrite")
	@ResponseBody
	public String write(@RequestBody Reply vo) throws Exception {
		srv.write(vo);
		return new Gson().toJson(vo);
	}
}
