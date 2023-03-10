package kh.project.stayfit.diary.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kh.project.stayfit.diary.model.service.DiaryService;
import kh.project.stayfit.diary.model.vo.Diary;
import kh.project.stayfit.diary.model.vo.Nutrition;


@Controller
@RequestMapping
public class DiaryController {
	@Autowired
	private DiaryService diaryService;
	
	@GetMapping("/diary")
	public ModelAndView diary(ModelAndView mv) {
		
		mv.addObject("sectionName", "diary/diarypage.jsp");
		mv.setViewName("index");
		
		return mv;
	}
	@PostMapping("/diary-write")
	@ResponseBody
	public String writeDiary(Diary diary) throws Exception {
		
		diaryService.diarywirte(diary);
		return "success";
	}
	
	@PostMapping("/search-meal")
	public ModelAndView searchMeal(ModelAndView mv, @RequestParam("keyword") String keyword) throws Exception {
		
		List<Nutrition> meal= diaryService.searchMeal(keyword);
		mv.addObject("meal", meal);
		return mv;
	}
}
