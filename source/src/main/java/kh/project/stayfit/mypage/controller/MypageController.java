package kh.project.stayfit.mypage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mypage")
public class MypageController {

	@GetMapping("/mywish")
	public ModelAndView myWish(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/mywish.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/mycart")
	public ModelAndView myCart(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/mycart.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/myproduct")
	public ModelAndView myProduct(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myproduct.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/myboard")
	public ModelAndView myBoard(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myboard.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/myprofile")
	public ModelAndView myProfile(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myprofile.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
}
