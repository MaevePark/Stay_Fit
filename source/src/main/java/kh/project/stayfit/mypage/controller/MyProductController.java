package kh.project.stayfit.mypage.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kh.project.stayfit.mypage.model.service.MyProductService;
import kh.project.stayfit.mypage.model.vo.MypageWish;

@Controller
public class MyProductController {
	@Autowired
	private MyProductService productservice;

//	@GetMapping("/mywish")
//	public List<MypageWish> myWishList(
//			@RequestParam("mid") int mid,
//			@RequestParam(name = "page", defaultValue = "1") String currentPageNumStr
//			) throws Exception {
//		int currentPageNum = Integer.parseInt(currentPageNumStr);
//		int limits = 6;
//		List<MypageWish> list = productservice.selectProductList(mid, currentPageNum, limits);
//		
//		return list;
//	}
//	@GetMapping("/mywish")
//	public int myWishTotalCount(@RequestParam("mid") int mid
//			) throws Exception {
//		int cnt = productservice.selectTotalCnt(mid);
//		
//		return cnt;
//	}
	
	
	
}
