package kh.project.stayfit.diary.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.GsonBuilder;

import kh.project.stayfit.diary.model.service.DiaryService;
import kh.project.stayfit.diary.model.vo.Diary;


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
	
	@GetMapping("/searchmeal")
	@ResponseBody
	public String searchMeal(@RequestParam("keyword") String keyword) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			dataMap.put("nutList", diaryService.searchMeal(keyword));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String result = new GsonBuilder().create().toJson(dataMap);
		return result;
	}
	
	@GetMapping("/searchexrc")
	@ResponseBody
	public String searchExrc(@RequestParam("keyword") String keyword) throws Exception {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			dataMap.put("exrcList", diaryService.searchExrc(keyword));
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String result = new GsonBuilder().create().toJson(dataMap);
		return result;
	}
	
}
