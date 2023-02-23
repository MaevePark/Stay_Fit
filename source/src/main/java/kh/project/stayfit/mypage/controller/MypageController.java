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
		//int currentPageNum = Integer.parseInt(currentPageNumStr);
		int limits = 1;
		int mid=3;
		int pageLimit = 5;
		
		
		//int page = Integer.parseInt(currentPageNumStr);
		int totalCnt = productservice.selectWishTotalCnt(mid);
		int end = 0;
		int start = 0;
		
		// 1. 데이터 개수를 페이지당 표기 개수로 나누었을 때
		// 2. 나머지 유무를 통해 페이지를 하나 덜 표기할것인지 말것인지
		// 3. 이 경우 다른 방법으로 1의 경우에서 0.9를 더해 판별하는 방법도 있다. 
		int totalPageCnt = (totalCnt % limits == 0)? (totalCnt / limits) : (totalCnt / limits)+1;
		
		// 1. 한번에 표기할 페이지 수를 반으로 나누어 그보다 작을 경우
		// 2. 시작 페이지는 1이고,
		// 3. 그보다 클 경우
		// 4. 현재 페이지에서 반을 뺀 페이지를 시작 페이지로 한다.
		start = (page <= (pageLimit/2)+1) ? 1 :  page-2;
		
		// 1. 첫 접근으로 첫 end페이지는 반드시 현재 페이지의 +2로
		// 2. 이후 페이지 이동시 end페이지가 총 페이지에 도달했는지 여부를 체크
		// 4. 아니라면 현재 페이지+2 가 최대 페이지로 나오는지 체크
		// 5. 맞다면 최대 페이지로 표기
		// 6. 아니라면 현 페이지+2
		end = (end >= totalPageCnt)? totalPageCnt : ((page <= (pageLimit/2)+1)? pageLimit :  page+2);
		
//		Map<String, Object> pagingMap = new HashMap<String, Integer>();
//		pagingMap.put("currentPageNum", currentPageNum);
//		pagingMap.put("totalPageCnt", totalPageCnt);
//		pagingMap.put("endPageNum", endPageNum);
//		pagingMap.put("startPageNum", startPageNum);
//		pagingMap.put("wishList", productservice.selectWishProductList(mid, currentPageNum, limits));
//		mv.addObject("contentWish", pagingMap);
		
		Map<String, Object> pagingMap = new HashMap<String, Object>();
		pagingMap.put("currentPage", page);
		pagingMap.put("totalPageCnt", totalPageCnt);
		pagingMap.put("end", end);
		pagingMap.put("start", start);
		
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
