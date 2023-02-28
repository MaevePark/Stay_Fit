package kh.project.stayfit.mypage.controller;

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
import kh.project.stayfit.mypage.model.service.ProfileService;

@Controller
@RequestMapping("/mypage")
public class MypageController {
	@Autowired
	private MyBoardService boardservice;
	@Autowired
	private ProfileService profileservice;
	@Autowired
	private MyProductService productservice;
	
	@GetMapping({"/profile", "/", ""}) // 사용자 정보
	public ModelAndView myProfile(ModelAndView mv) {
		
		mv.addObject("sectionName", "mypage/myprofile.jsp");
		mv.addObject("urlpattern", "mypage/profile");
		mv.setViewName("index");
		
		return mv;
	}

	@GetMapping("/wish") // 찜목록
	public ModelAndView myWish(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			//,@RequestParam("mid") int mid
			) throws Exception {
		int mid=3; //TODO 얘는 지워야돼...
		int limits = 6;
		int pageLimit = 5;
		
		int totalCnt = productservice.selectWishTotalCnt(mid);
		Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
		
		mv.addObject("sectionName", "mypage/mywish.jsp");
		mv.addObject("urlpattern", "mypage/wish");
		mv.addObject("wishList", productservice.selectWishProductList(mid, page, limits));
		mv.addObject("pagingMap", pagingMap);
		mv.setViewName("index");
		return mv;
	}
	

	
	@GetMapping("/cart") // 장바구니
	public ModelAndView myCart(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			//,@RequestParam("mid") int mid
			) throws Exception {
		int mid=3; //TODO 얘는 지워야돼...
		int limits = 999;
		//int pageLimit = 5;
		
		//int totalCnt = productservice.selectWishTotalCnt(mid);
		//Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
		
		mv.addObject("sectionName", "mypage/mycart.jsp");
		mv.addObject("urlpattern", "mypage/cart");
		mv.addObject("cartList", productservice.selectCartProductList(mid, page, limits));
		//mv.addObject("pagingMap", pagingMap);
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/order") // 구매기록
	public ModelAndView myProduct(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			//,@RequestParam("mid") int mid
			) throws Exception {
		int mid=3; //TODO 얘는 지워야돼...
		int limits = 15;
		int pageLimit = 5;
		
		int totalCnt = productservice.selectWishTotalCnt(mid);
		Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
		
		mv.addObject("sectionName", "mypage/myproduct.jsp");
		mv.addObject("urlpattern", "mypage/order");
		mv.addObject("orderList", productservice.selectOrderProductList(mid, page, limits));
		mv.addObject("pagingMap", pagingMap);
		mv.setViewName("index");
		
		return mv;
	}
	
	@GetMapping("/board") // 북마크, 작성한 글
	public ModelAndView myBoard(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name="type") String type
			, @RequestParam(name="boardCategory", defaultValue = "1") int boardCategory
			, @RequestParam(name="searchRange", defaultValue = "1") int searchRange
			, @RequestParam(name="searchword", defaultValue = "") String searchword
			//,@RequestParam("mid") int mid
			) throws Exception {
		int mid=3; //TODO 얘는 지워야돼...
		int limits = 10;
		int pageLimit = 5;
		
		int totalCnt = boardservice.selectBoardTotalCnt(mid, type, boardCategory, searchRange, searchword);
		Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);

		mv.addObject("sectionName", "mypage/myboard.jsp");
		mv.addObject("urlpattern", "mypage/board");
		mv.addObject("boardList", boardservice.selectBoardList(mid, type, boardCategory, searchRange, searchword, page, limits));
		mv.addObject("pagingMap", pagingMap);
		mv.addObject("type", type);
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
}
