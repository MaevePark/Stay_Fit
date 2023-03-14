package kh.project.stayfit.health.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@ResponseBody
	public ModelAndView selectCenterlist(ModelAndView mv, @RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "lid", defaultValue = "0") int lid,
			@RequestParam(name = "category", required=false, defaultValue = "") String category,
			@RequestParam(name = "keyword", required=false, defaultValue = "") String keyword) throws Exception {
		
		
		int limits = 10; // 한 페이지당 보여줄 게시글 수
		int pageLimit = 3;  // 한 번에 보여줄 페이지 수
		int totalPageCnt = service.totalPageCnt(lid, category, keyword);		
		Map<String, Object> pagingMap = Paging.paging(page, totalPageCnt, limits, pageLimit); 
		
		List<HealthCenter> list = service.selectCenterlist(lid, category, keyword, page, limits);
		
	
		mv.addObject("lid", lid); 
		mv.addObject("category", category);
		mv.addObject("keyword", keyword);
		
		mv.addObject("centerList", list);
		mv.addObject("sectionName", "health/centerlist.jsp");
		mv.addObject("urlpattern", "health/centerlist.jsp");
		mv.addObject("pagingMap", pagingMap);
		mv.setViewName("index");
		return mv;
	}
}