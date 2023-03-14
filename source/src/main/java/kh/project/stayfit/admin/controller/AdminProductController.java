package kh.project.stayfit.admin.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kh.project.stayfit.admin.model.service.AdminProductService;
import kh.project.stayfit.seller.model.vo.SellerProduct;

@Controller
@RequestMapping("/admin")
public class AdminProductController {
	
	@Autowired
	private AdminProductService service;
	
	
	@GetMapping("/product")
	public ModelAndView product(ModelAndView mv, HttpServletRequest request) throws Exception {
		
		// 로그인을 하지 않은 경우나 admin이 아닌 사용자가 url로 접근하는 것 막는 코드
		if(request.getSession().getAttribute("mrole") == null || !('A' == (char)request.getSession().getAttribute("mrole"))){
			mv.addObject("func", "adminLogin");
			mv.addObject("msg", "관리자만 접근 가능한 페이지입니다.");
			mv.setViewName("/admin/resultAlert");
		} else {
			mv.addObject("currentMenu", 3);
			mv.setViewName("/admin/product");
		}
		return mv;
	}
	
	// 상품목록
	@GetMapping("/adminproductlist")
	@ResponseBody
	public String selectProduct(@RequestParam(name="searchword", required=false) String searchword,
								@RequestParam("category") String category,
								@RequestParam("sort") String sort
								) throws Exception {
		
		List<SellerProduct> list = service.selectProduct(searchword, category, sort);

		return new Gson().toJson(list);
	}
	
	
	@ExceptionHandler(Exception.class) // 모든 Exception시 여기로
	public ModelAndView exceptionHandler(Exception e /*, ModelAndView mv -> 작성시 오류발생 */) {
		// 프로젝트초기에는 e.printStackTrace(); 로 로그 봐야함. 나중에 지우기
		e.printStackTrace();
		ModelAndView mv = new ModelAndView(); 
		mv.addObject("errMsg", e.getMessage());
		mv.setViewName("/AccessDenied");
		return mv;
	}
}