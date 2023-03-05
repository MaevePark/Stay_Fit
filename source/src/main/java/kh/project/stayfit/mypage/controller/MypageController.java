package kh.project.stayfit.mypage.controller;

import java.io.PrintWriter;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.GsonBuilder;

import io.github.cdimascio.dotenv.Dotenv;
import kh.project.stayfit.common.FileSave;
import kh.project.stayfit.common.Paging;
import kh.project.stayfit.mypage.model.service.MyBoardService;
import kh.project.stayfit.mypage.model.service.MyProductService;
import kh.project.stayfit.mypage.model.service.ProfileService;
import kh.project.stayfit.mypage.model.vo.MypageMember;
import kh.project.stayfit.mypage.model.vo.MypageWish;

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
	public ModelAndView myProfile(
			ModelAndView mv
			//, @RequestParam(name="mid") int mid
			) {
		int mid = 3;
		MypageMember vo = new MypageMember();
		try {
			vo = profileservice.selectMember(mid);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("sectionName", "mypage/myprofile.jsp");
		mv.addObject("urlpattern", "mypage/profile");
		mv.addObject("mypageMember", vo);
		mv.setViewName("index");
		
		return mv;
	}
	
	@PostMapping("/updateProfile")
	public String updateProfile(
			@RequestParam(name="profimg", required = false) MultipartFile multipartFile
			, @RequestParam(name="mname", required = false) String mname
			, @RequestParam(name="pwd", required = false) String pwd
			, HttpServletRequest request
			//, @RequestParam(name="mid") int mid
			) {
		int mid = 3;
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> updateMap = new HashMap<String, Object>();
		try {
			MypageMember vo = profileservice.selectMember(mid);
			
			updateMap.put("mname", mname);
			updateMap.put("pwd", pwd);
			updateMap.put("profimg", null);
			updateMap.put("mid", mid);
			if(multipartFile != null) {
				if(updateMap.get("mname") != null) {
					vo.setMname((String) updateMap.get("mname"));
				}
				result = updateProfImg(multipartFile, request, vo);
				System.out.println("새로운 프사 : "+result.get("newUrl"));
				updateMap.replace("profimg", result.get("newUrl"));
			}
			if((multipartFile != null && result.size() > 0) || multipartFile == null) {
				
				System.out.println("----------------------------------------------------------");
				System.out.println("controller 영역");
				System.out.println(updateMap.get("mname"));
				System.out.println(updateMap.get("pwd"));
				System.out.println(updateMap.get("profimg"));
				System.out.println(updateMap.get("mid"));
				
				profileservice.editProfile(updateMap);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/mypage/profile";
	}
	
	public Map<String, Object> updateProfImg(
			MultipartFile multipartFile
			, HttpServletRequest request
			, MypageMember vo
			) throws Exception {
		Map<String, Object> upload_result = new HashMap<String, Object>();

// multipartFile 이 있을 때 : '새로운 사진 업로드'시
		if (multipartFile != null) {

			String savedFileName = FileSave.saveFile2(
					multipartFile
					, FileSave.FILE_PROFILE_PATH
					, request
					, vo.getMid()
					);
			String localFilePath = request.getSession().getServletContext().getRealPath("")
					+ FileSave.FILE_PROFILE_PATH;
			Dotenv dotenv = Dotenv.load();
			Cloudinary cloudinary = new Cloudinary(dotenv.get("CLOUDINARY_URL"));
			cloudinary.config.secure = true;

			try {
// https://res.cloudinary.com/doxmm0ofz/image/upload/v1677233838/fd689c23-b84a-4d19-8292-87cfdc656201_w_20220207180134_5798062860.jpg
				String originalImage = vo.getProfimg(); // 기존 이미지 url

// <url에서 마지막 / 와 . 사이에 글자만 잘라내기>
// 1. 마지막 /와 .의 인덱스를 찾기
				int lastSlashIndex = originalImage.lastIndexOf('/');
				int lastDotIndex = originalImage.lastIndexOf('.');
// 2. 인덱스를 이용하여 마지막 /와 . 사이에 있는 문자열을 추출
				String publicId = originalImage.substring(lastSlashIndex + 1, lastDotIndex);
				System.out.println(publicId); // 출력: fd689c23-b84a-4d19-8292-87cfdc656201_w_20220207180134_5798062860

// 이미지 업로드
				Map params1 = ObjectUtils.asMap("use_filename", true, "unique_filename", false, "overwrite", true);
				Map result = cloudinary.uploader().upload(localFilePath + savedFileName, params1); // 업로드시 map형태로 파일정보를
																									// 리턴함.
				System.out.println("★★★ result : " + result);
				String newUrl = result.get("secure_url").toString();
				System.out.println("★★★ newUrl : " + newUrl);

// 기존 이미지가 있었다면 그 이미지 삭제
				if ((originalImage != null && !originalImage.equals("")) && !originalImage.equals("https://res.cloudinary.com/doxmm0ofz/image/upload/v1675945711/profile/defaultprofile_rmpnyj.jpg")) {
					try {
						cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap());
						System.out.println("File deleted successfully.");
					} catch (Exception e) {
						System.out.println("Error occurred while deleting file: " + e.getMessage());
					}
				}
				
				upload_result.put("savedFileName", savedFileName);
				upload_result.put("newUrl", newUrl);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

// multipartFile 이 없을 때 : '이전 사진으로' 클릭시, 또는 파일선택창에서 '취소' 클릭시  -> input type="hidden"으로 받아 온 기존 pimage 그대로 DB에 유지

		return upload_result;
	}
	
	@GetMapping("/wish") // 찜목록 호출
	public ModelAndView myWish(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			//,@RequestParam(name="mid") int mid
			) throws Exception {
		int mid=3; //TODO 얘는 지워야돼...
		int limits = 6;
		int pageLimit = 5;
		
		try {
			int totalCnt = productservice.selectWishTotalCnt(mid);
			Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
			
			mv.addObject("wishList", productservice.selectWishProductList(mid, page, limits));
			mv.addObject("pagingMap", pagingMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		mv.addObject("urlpattern", "mypage/wish");
		mv.addObject("sectionName", "mypage/mywish.jsp");
		mv.setViewName("index");
		return mv;
	}
	
	//찜목록 재호출
	@GetMapping("/loadwish")
	@ResponseBody
	public String loadWish(
			@RequestParam(name = "page", defaultValue = "1") int page
			//, @RequestParam("mid") String mid
			) {
		int mid=3; //TODO 얘는 지워야돼...
		int limits = 6;
		int pageLimit = 5;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		try {
			int totalCnt = productservice.selectWishTotalCnt(mid);
			Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
			dataMap.put("wishList", productservice.selectWishProductList(mid, page, limits));
			dataMap.put("pagingMap", pagingMap);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		String result = new GsonBuilder().create().toJson(dataMap);
		//mv.addAllObjects(map);
		return result;
	}
	
	//찜목록 삭제
	@GetMapping("/delwish")
	public int delWish(
			HttpServletResponse response
			, @RequestParam("mid") int mid
			, @RequestParam("pid") int pid
			) {
		int result = 0;
		MypageWish vo = new MypageWish();
		vo.setMid(mid);
		vo.setPid(pid);
		try {
			result = productservice.deleteWish(vo);
			PrintWriter out = response.getWriter();
			out.append(new GsonBuilder().create().toJson(result));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	//찜목록 수량 수정
	@GetMapping("/updatepcount")
	public int updatePCount(
			HttpServletResponse response
			, @RequestParam("pcount") int pcount
			, @RequestParam("pid") int pid
			//, @RequestParam("mid") int mid
			) {
		int mid = 3;
		int result = 0;
		
		
		
		
		return 0;
	}
	
	
	@GetMapping("/cart") // 장바구니
	public ModelAndView myCart(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			//,@RequestParam(name="mid") int mid
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
	
	@GetMapping("/insertcart")
	public int insertCart(
			HttpServletResponse response
			, @RequestParam("mid") int mid
			, @RequestParam("pid") int pid
			, @RequestParam("pcount") int pcount
			) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		MypageWish vo = new MypageWish();
		vo.setMid(mid);
		vo.setPid(pid);
		try {
			result1 = productservice.insertCart(vo);
			result2 = productservice.deleteWish(vo);
			
			PrintWriter out = response.getWriter();
			out.append(new GsonBuilder().create().toJson(result));
			out.flush();
			out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	@GetMapping("/order") // 구매기록
	public ModelAndView myProduct(
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			//,@RequestParam(name="mid") int mid
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
			//,@RequestParam(name="mid") int mid
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
		mv.addObject("searchword", searchword);
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
	

	
	
	
	
}
