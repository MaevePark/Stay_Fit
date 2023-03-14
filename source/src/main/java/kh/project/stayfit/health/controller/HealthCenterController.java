package kh.project.stayfit.health.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.common.Paging;
import kh.project.stayfit.health.model.service.HealthCenterService;
import kh.project.stayfit.health.model.vo.HealthCenter;

@Controller
@RequestMapping("/health")
public class HealthCenterController {

	@Autowired
	private HealthCenterService service;

	// 게시글 목록 조회, 글 검색, 페이징
	@GetMapping("/centerlist")
	public ModelAndView selectCenterlist(ModelAndView mv,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "lid", defaultValue = "0") int lid,
			@RequestParam(name = "search", defaultValue = "") String search,
			@RequestParam(name = "keyword", defaultValue = "") String keyword) throws Exception {
		
		int limits = 10; // 한 페이지당 보여줄 게시글 수
		int pageLimit = 2;  // 한 번에 보여줄 페이지 수
		int totalPageCnt = service.totalPageCnt(lid, search, keyword); // 전체 게시글 수
		
		// 게시글 목록 조회, 글 검색
		List<HealthCenter> list = service.selectCenterlist(lid, search, keyword, page, limits);
		
		// 페이징
		Map<String, Object> pagingMap = Paging.paging(page, totalPageCnt, limits, pageLimit);

		mv.addObject("search", search); // 지역 카테고리
		mv.addObject("keyword", keyword); // 검색어
		mv.addObject("centerList", list); // 글 목록
		mv.addObject("pagingMap", pagingMap); // 페이징
		mv.addObject("sectionName", "health/centerlist.jsp");
		mv.addObject("urlpattern", "health/centerlist");
		mv.setViewName("index");
		return mv;
	}

	@ExceptionHandler(Exception.class) // 든 Exception시 여기로
    public ModelAndView exceptionHandler(Exception e /*, ModelAndView mv -> 작성시 오류발생*/) {
        // 프로젝트초기에는 e.printStackTrace(); 로 로그 봐야함. 나중에 지우기
        e.printStackTrace();
        ModelAndView mv = new ModelAndView(); 
        mv.addObject("errMsg", e.getMessage());
		mv.setViewName("/AccessDenied");
        return mv;
    }
}