package kh.project.stayfit.health.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.health.model.vo.HealthInfoForBmi;

@Controller
@RequestMapping("/health")
public class BmiController {
	
	// bmi 정보 입력
	@GetMapping("/bmiwrite")
	public ModelAndView bmiWrite(ModelAndView mv) {

		mv.addObject("sectionName", "health/bmiwrite.jsp");
		mv.setViewName("index");

		return mv;
	}
	
	// bmi 정보 출력
	@PostMapping("/bmilist")
	public ModelAndView bmiList(ModelAndView mv
			, HealthInfoForBmi healthInfoVo) {

		mv.addObject("healthInfoVo", healthInfoVo);
		mv.addObject("sectionName", "health/bmilist.jsp");
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
