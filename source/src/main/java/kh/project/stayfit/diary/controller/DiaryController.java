package kh.project.stayfit.diary.controller;

import java.io.PrintWriter;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import kh.project.stayfit.diary.model.vo.Calendar;
import kh.project.stayfit.diary.model.vo.Diary;


@Controller
@RequestMapping
public class DiaryController {
	@Autowired
	private DiaryService diaryService;
	
	@GetMapping("/diary")
	public ModelAndView diary(
			ModelAndView mv
			, HttpServletRequest request
			) {
		//mid값 호출
		int mid = -1;
		if(request.getSession().getAttribute("mid") == null){
//			mv.addObject("sectionName", "member/login.jsp");
//			mv.addObject("urlpattern", "member/login");
			mv.setViewName("redirect:/member/login");
			return mv;
		}
		mid = (int) request.getSession().getAttribute("mid");
		if(mid != -1) {
		mv.addObject("sectionName", "diary/diarypage.jsp");
		mv.addObject("urlpattern", "diary/diarypage");
		}
		mv.setViewName("index");
		return mv;
	}
	
	@PostMapping("/callDiary")
	public void callDiary(
			ModelAndView mv
			, HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam(name="date", defaultValue="") String date
			) {
		//mid값 호출
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
		}
		
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		try {
			List<Diary> diaryList = new ArrayList<Diary>();
			Map<String, Object> dataMap = new HashMap<String, Object>();
			dataMap.put("date", date);
			dataMap.put("mid", mid);
			diaryList = diaryService.selectList(dataMap);
			
			List<Calendar> calendarList = new ArrayList<Calendar>();
			for(int i=0; i < diaryList.size(); i++) {
				Diary diary = diaryList.get(i);
				String ddate = formatter.format(diary.getDdate());
				System.out.println("ddate : "+ddate);
				int fullKcal = diary.getBreakfast() + diary.getSnack1() + diary.getLunch() + diary.getSnack2() + diary.getDinner() + diary.getSnack3();
				System.out.println("fullKcal : "+fullKcal);
				int weight = diary.getWeight();
				System.out.println("weight : "+weight);
				int burnKcal = diary.getExercise();
				System.out.println("burnKcal : "+burnKcal);
				
				System.out.println("이건 "+i+"번째 반복");
				
				for(int j=0; j<3; j++) {
					Calendar calendar = new Calendar();
					calendar.setStart(ddate);
					if(j==0) {
						System.out.println("칼로리");
						calendar.setTitle(Integer.toString(fullKcal));
					} else if(j==1) {
						System.out.println("운동량");
						calendar.setTitle(Integer.toString(burnKcal));
					} else if(j==2) {
						System.out.println("몸무게");
						calendar.setTitle(Integer.toString(weight));
						
					}
					calendarList.add(calendar);
				}
			}
			
			String result = new GsonBuilder().create().toJson(calendarList);
			System.out.println(calendarList.size());

			response.setContentType("application/json"); // 인코딩 설정 추가
	        response.setCharacterEncoding("UTF-8"); // 인코딩 설정 추가
			
			PrintWriter out = response.getWriter();
			out.append(new GsonBuilder().create().toJson(diaryList));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	@PostMapping("/diarywrite")
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