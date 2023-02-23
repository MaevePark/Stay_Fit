package kh.project.stayfit.mypage.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.common.Paging;
import kh.project.stayfit.mypage.model.service.MyBoardService;
import kh.project.stayfit.mypage.model.service.MyProductService;
import kh.project.stayfit.mypage.model.service.MyReplyService;
import kh.project.stayfit.mypage.model.service.ProfileService;
import kh.project.stayfit.shop.model.vo.ShopProduct;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MyBoardService boardservice;
	@Autowired
	private MyReplyService replyservice;
	@Autowired
	private ProfileService profileservice;
	@Autowired
	private MyProductService productservice;
	
	@GetMapping({"/myprofile", "/", ""}) // 사용자 정보
	public ModelAndView myProfile(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myprofile.jsp");
		mv.setViewName("index");
		
		return mv;
	}

	@GetMapping("/mywish") // 찜목록
	public ModelAndView myWish(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			//,@RequestParam("mid") int mid
			) throws Exception {
		int mid=3;
		
		int limits = 1;
		int pageLimit = 5;
		
		int totalCnt = productservice.selectWishTotalCnt(mid);
		Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
		
		mv.addObject("sectionName", "mypage/mywish.jsp");
		mv.addObject("wishList", productservice.selectWishProductList(mid, page, limits));
		mv.addObject("pagingMap", pagingMap);
		mv.setViewName("index");
		return mv;
	}
	
	
	
	
	
//	@GetMapping("/mywishList")
//	public List<ShopProduct> myWishList(
//			//@RequestParam("mid") int mid,
//			@RequestParam(name = "page", defaultValue = "1") String currentPageNumStr
//			) throws Exception {
//		int currentPageNum = Integer.parseInt(currentPageNumStr);
//		int limits = 6;
//		int mid=3;
//		List<ShopProduct> list = productservice.selectProductList(mid, currentPageNum, limits);
////		for(int i=0; i<list.size(); i++) {
////			System.out.println("찜목록 "+i+"번째 상품 : "+list.get(i));
////		}
//		return list;
//	}
	
	@GetMapping("/mycart") // 장바구니
	public ModelAndView myCart(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") String currentPageNumStr
			//,@RequestParam("mid") int mid
			) throws Exception {
		int currentPageNum = Integer.parseInt(currentPageNumStr);
		int limits = 6;
		int mid=3;
		
		int totalCnt = productservice.selectCartTotalCnt(mid);
		int end = (int) (Math.ceil(Integer.parseInt(currentPageNumStr)/10.0))*10;
		int start = end-5;
		
		mv.addObject("sectionName", "mypage/mycart.jsp");
		mv.addObject("cartList", productservice.selectCartProductList(mid, currentPageNum, limits));
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/myorder") // 구매기록
	public ModelAndView myProduct(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") String currentPageNumStr
			//,@RequestParam("mid") int mid
			) throws Exception {
		int currentPageNum = Integer.parseInt(currentPageNumStr);
		int limits = 6;
		int mid=3;
		
		int totalCnt = productservice.selectCartTotalCnt(mid);
		int end = (int) (Math.ceil(Integer.parseInt(currentPageNumStr)/10.0))*10;
		int start = end-5;
		
		mv.addObject("sectionName", "mypage/myproduct.jsp");
		mv.addObject("orderList", productservice.selectCartProductList(mid, currentPageNum, limits));
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
