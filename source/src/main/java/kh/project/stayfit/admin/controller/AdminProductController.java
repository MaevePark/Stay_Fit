package kh.project.stayfit.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
	public ModelAndView product(ModelAndView mv) {
		
		mv.addObject("currentMenu", 3);
		mv.setViewName("/admin/product");
		
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
}