package kh.project.stayfit.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.project.stayfit.admin.model.service.DashboardService;
import kh.project.stayfit.admin.model.vo.AdminDashboard1;
import kh.project.stayfit.admin.model.vo.AdminDashboard2;
import kh.project.stayfit.admin.model.vo.AdminDashboard3;

@Controller
@RequestMapping("/admin")
public class DashboardController {
	
	@Autowired
	private DashboardService service;
	
	
	@GetMapping("/dashboard")
	public ModelAndView dashboard(ModelAndView mv) throws Exception {
		
		mv.addObject("currentMenu", 1);
		mv.setViewName("/admin/dashboard");
		
		return mv;
	}
	
	// 첫번째 차트
	@PostMapping("/chart1")
	@ResponseBody
	public String selectChart1() throws Exception {

		List<AdminDashboard1> list = service.selectChart1();

		return new Gson().toJson(list);
	}
	
	// 두번째 차트
	@PostMapping("/chart2")
	@ResponseBody
	public String selectChart2() throws Exception {
		
		List<AdminDashboard2> list = service.selectChart2();
		
		return new Gson().toJson(list);
	}
	
	// 세번째 차트
	@PostMapping("/chart3")
	@ResponseBody
	public String selectChart3() throws Exception {
		
		List<AdminDashboard3> list = service.selectChart3();
		
		return new Gson().toJson(list);
	}
	
	
	
	@ExceptionHandler(Exception.class) // 든 Exception시 여기로
	public ModelAndView handlerBoardException(Exception e /*, ModelAndView mv -> 작성시 오류발생 */) {
		// 프로젝트초기에는 e.printStackTrace(); 로 로그 봐야함. 나중에 지우기
		e.printStackTrace();
		ModelAndView mv = new ModelAndView(); 
		mv.addObject("errMsg", e.getMessage());
		mv.setViewName("/error");
		return mv;
	}
	
	
	
	
	
	
	
}
