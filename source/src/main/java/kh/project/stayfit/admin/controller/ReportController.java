package kh.project.stayfit.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.project.stayfit.admin.model.service.AdminBoardService;
import kh.project.stayfit.admin.model.vo.AdminBoard;
import kh.project.stayfit.admin.model.vo.AdminReport;

@Controller
@RequestMapping("/admin")
public class ReportController {
	
	@Autowired
	private AdminBoardService service;
	
	
	@GetMapping("/report")
	public ModelAndView report(ModelAndView mv) {
		
		mv.addObject("currentMenu", 5);
		mv.setViewName("/admin/report");
		
		return mv;
	}
	
	// 목록 출력
	@GetMapping("/reportlist")
	@ResponseBody
	public String selectReport(@RequestParam("reason") String reason,
								@RequestParam("sort") String sort
								) throws Exception {
		
		List<AdminReport> list = service.selectReport(reason, sort);

		return new Gson().toJson(list);
	}
	
//	// 신고댓글 삭제
//	@PostMapping("/reportdelete")
//	@ResponseBody
//	public int deleteBoard(@RequestParam("bid") String bid) throws Exception {
//		
//		int result = service.deleteBoard(bid);
//
//		return result;
//	}
	
	
	
}