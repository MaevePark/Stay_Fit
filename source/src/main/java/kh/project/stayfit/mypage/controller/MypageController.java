package kh.project.stayfit.mypage.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.mypage.model.service.MyBoardService;
import kh.project.stayfit.mypage.model.service.MyProductService;
import kh.project.stayfit.mypage.model.service.MyReplyService;
import kh.project.stayfit.mypage.model.service.ProfileService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MyBoardService boardservice;
	private MyReplyService rplyservice;
	private ProfileService profileservice;
	
	@GetMapping({"/myprofile", "/", ""}) // 사용자 정보
	public ModelAndView myProfile(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myprofile.jsp");
		mv.setViewName("index");
		
		return mv;
	}

	@GetMapping("/mywish") // 찜목록
	public ModelAndView myWish(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/mywish.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/mycart") // 장바구니
	public ModelAndView myCart(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/mycart.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/myproduct") // 구매기록
	public ModelAndView myProduct(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myproduct.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/myboard") // 북마크, 공감글, 작성한 글
	public ModelAndView myBoard(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myboard.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
}
