package kh.project.stayfit.mypage.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
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
import kh.project.stayfit.mypage.model.vo.MypageCart;
import kh.project.stayfit.mypage.model.vo.MypageMember;
import kh.project.stayfit.mypage.model.vo.MypageOrder;
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
	
//	@GetMapping({"*"})
//	public ModelAndView profileAccess(
//			HttpServletRequest request,
//			ModelAndView mv
//			, @RequestParam(name="mid", defaultValue = "-1") int mid
//			) {
//		System.out.println("mid = "+mid);
//		if(request.getSession().getAttribute("mid") != null) {
//			mid = (int) request.getSession().getAttribute("mid");
//			System.out.println("mid = "+mid);
//		}
//		
//		if(mid == -1) {
//			System.out.println("mid = "+mid);
//			mv.addObject("sectionName", "member/login.jsp");
//			mv.addObject("urlpattern", "member/login");
//		} else {
//			
//		}
//		
//		
//		return mv;
//	}
	
	@GetMapping({"/profile", "/", ""}) // 사용자 정보
	public ModelAndView myProfile(
			HttpServletRequest request,
			ModelAndView mv
			) {
		MypageMember vo = new MypageMember();
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			mv.addObject("sectionName", "member/login.jsp");
			mv.addObject("urlpattern", "member/login");
		} else {
			try {
				vo = profileservice.selectMember(mid);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			mv.addObject("sectionName", "mypage/myprofile.jsp");
			mv.addObject("urlpattern", "mypage/profile");
			mv.addObject("mypageMember", vo);
		}
		
		
		mv.setViewName("index");
		
		return mv;
	}
	
	//프로필 수정
	@PostMapping("/updateProfile")
	public String updateProfile(
			@RequestParam(name="profimg", required = false) MultipartFile multipartFile
			, @RequestParam(name="mname", required = false) String mname
			, @RequestParam(name="pwd", required = false) String pwd
			, HttpServletRequest request
			) {
		Map<String, Object> result = new HashMap<String, Object>();
		Map<String, Object> updateMap = new HashMap<String, Object>();
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid != -1) {
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
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
				System.out.println("originalImage : "+originalImage);
				System.out.println("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
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
			HttpServletRequest request,
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			) throws Exception {
		int limits = 6;
		int pageLimit = 5;
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			mv.addObject("sectionName", "member/login.jsp");
			mv.addObject("urlpattern", "member/login");
		} else {
			try {
				int totalCnt = productservice.selectWishTotalCnt(mid);
				Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
				
				mv.addObject("wishList", productservice.selectWishProductList(mid, page, limits));
				mv.addObject("pagingMap", pagingMap);
				mv.addObject("urlpattern", "mypage/wish");
				mv.addObject("sectionName", "mypage/mywish.jsp");
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
		}
		mv.setViewName("index");
		return mv;
	}
	//찜목록 재호출
	@GetMapping("/loadwish")
	@ResponseBody
	public String loadWish(
			HttpServletRequest request,
			@RequestParam(name = "page", defaultValue = "1") int page
			) {
		int limits = 6;
		int pageLimit = 5;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid != -1) {
			try {
				int totalCnt = productservice.selectWishTotalCnt(mid);
				Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
				dataMap.put("wishList", productservice.selectWishProductList(mid, page, limits));
				dataMap.put("pagingMap", pagingMap);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			//mv.addAllObjects(map);
		}
		String result = new GsonBuilder().create().toJson(dataMap);
		return result;
	}
	//찜목록 삭제
	@GetMapping("/delwish")
	public void delWish(
			HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("pid") int pid
			) {
		int result = 0;
		MypageWish vo = new MypageWish();
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid != -1) {
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
		}
	}
	//찜목록 추가
	@GetMapping("/insertwish")
	public void insertWish(
			HttpServletResponse response
			, HttpServletRequest request
			, @RequestParam("pid") int pid
			) {
		int result = 0;
		MypageWish vo = new MypageWish();
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			result = 3;
			try {
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			vo.setMid(mid);
			vo.setPid(pid);
			try {
				result = productservice.insertWish(vo);
				
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (DuplicateKeyException e) {
			    result = 2;
			    PrintWriter out;
				try {
					out = response.getWriter();
					out.append(new GsonBuilder().create().toJson(result));
					out.flush();
					out.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	
	// 장바구니
	@GetMapping("/cart")
	public ModelAndView myCart(
			HttpServletRequest request,
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			) throws Exception {
		int limits = 999;
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			mv.addObject("sectionName", "member/login.jsp");
			mv.addObject("urlpattern", "member/login");
		} else {
			mv.addObject("sectionName", "mypage/mycart.jsp");
			mv.addObject("urlpattern", "mypage/cart");
			mv.addObject("cartList", productservice.selectCartProductList(mid, page, limits));
		}
		mv.setViewName("index");
		
		return mv;
	}
	
	//장바구니 재호출
	@GetMapping("/loadcart")
	@ResponseBody
	public String loadCart(
			HttpServletRequest request
			, @RequestParam(name = "page", defaultValue = "1") int page
			) {
		int limits = 999;
		Map<String, Object> dataMap = new HashMap<String, Object>();
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid != -1) {
		
			try {
				dataMap.put("cartList", productservice.selectCartProductList(mid, page, limits));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		String result = new GsonBuilder().create().toJson(dataMap);
		return result;
	}
	//장바구니 추가
	@GetMapping("/insertcart")
	public void insertCart_1(
			HttpServletResponse response
			, HttpServletRequest request
			, @RequestParam("pid") int pid
			, @RequestParam("pcount") int pcount
			) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		MypageWish vo = new MypageWish();
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			result = 3;
			try {
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			vo.setMid(mid);
			vo.setPid(pid);
			try {
				result1 = productservice.insertCart(vo);
				if(result1 > 0) {
					result2 = productservice.deleteWish(vo);
					if(result2 > 0) result = 1;
				}
				
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (DuplicateKeyException e) {
			    result = 2;
			    PrintWriter out;
				try {
					out = response.getWriter();
					out.append(new GsonBuilder().create().toJson(result));
					out.flush();
					out.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	//장바구니 추가
	@GetMapping("/minsertcart")
	public void insertCart_2(
			HttpServletResponse response
			, HttpServletRequest request
			, @RequestParam("pid") int pid
			, @RequestParam("pcount") int pcount
			) {
		int result = 0;
		MypageWish vo = new MypageWish();
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			result = 3;
			try {
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		} else {
			vo.setMid(mid);
			vo.setPid(pid);
			try {
				result = productservice.insertCart(vo);
				
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (DuplicateKeyException e) {
			    result = 2;
			    PrintWriter out;
				try {
					out = response.getWriter();
					out.append(new GsonBuilder().create().toJson(result));
					out.flush();
					out.close();
				} catch (IOException e1) {
					e1.printStackTrace();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	//장바구니 삭제
	@GetMapping("/delcart")
	public void delCart(
			HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("pid") int pid
			) {
		int result = 0;
		MypageCart vo = new MypageCart();
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid != -1) {
			vo.setMid(mid);
			vo.setPid(pid);
			try {
				result = productservice.deleteCart(vo);
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	//장바구니 수량 수정
	@GetMapping("/updatepcount")
	public void updatePCount(
			HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("pcount") int pcount
			, @RequestParam("pid") int pid
			) {
		int result = 0;
		
		MypageCart vo = new MypageCart();
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid != -1) {
			vo.setMid(mid);
			vo.setPid(pid);
			vo.setPcount(pcount);
			
			try {
				result = productservice.updateCart(vo);
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	
	@GetMapping("/order") // 구매기록
	public ModelAndView myProduct(
			HttpServletRequest request,
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			) throws Exception {
		int limits = 15;
		int pageLimit = 5;
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			mv.addObject("sectionName", "member/login.jsp");
			mv.addObject("urlpattern", "member/login");
		} else {
			int totalCnt = productservice.selectOrderTotalCnt(mid);
			Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
			
			mv.addObject("sectionName", "mypage/myproduct.jsp");
			mv.addObject("urlpattern", "mypage/order");
			mv.addObject("orderList", productservice.selectOrderProductList(mid, page, limits));
			mv.addObject("pagingMap", pagingMap);
		}
		mv.setViewName("index");
		
		return mv;
	}
	//구매기록 등록
	@GetMapping("/insertOrder")
	public void insertOrder(
			HttpServletRequest request
			, HttpServletResponse response
			, @RequestParam("pid") int pid
			, @RequestParam("pcount") int pcount
			) {
		int result = 0;
		int result1 = 0;
		int result2 = 0;
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid != -1) {
			MypageOrder ovo = new MypageOrder();
			ovo.setMid(mid);
			ovo.setPid(pid);
			ovo.setOcount(pcount);
			
			MypageCart cvo = new MypageCart();
			cvo.setMid(mid);
			cvo.setPid(pid);
			
			try {
				result1 = productservice.insertOrder(ovo);
				
				if(result1 == 1) {
					result2 = productservice.deleteCart(cvo);
					if(result2 > 0) result = 1;
				} else if(result1 == 2) {
					result = 2;
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			try {
				PrintWriter out = response.getWriter();
				out.append(new GsonBuilder().create().toJson(result));
				out.flush();
				out.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	
	@GetMapping("/board") // 북마크, 작성한 글
	public ModelAndView myBoard(
			HttpServletRequest request,
			ModelAndView mv
			,@RequestParam(name = "page", defaultValue = "1") int page
			, @RequestParam(name="type") String type
			, @RequestParam(name="boardCategory", defaultValue = "0") int boardCategory
			, @RequestParam(name="searchRange", defaultValue = "1") int searchRange
			, @RequestParam(name="searchword", defaultValue = "") String searchword
			) throws Exception {
		int limits = 10;
		int pageLimit = 5;
		
		int mid = -1;
		if(request.getSession().getAttribute("mid") != null) {
			mid = (int) request.getSession().getAttribute("mid");
			System.out.println("mid = "+mid);
		}
		
		if(mid == -1) {
			System.out.println("mid = "+mid);
			mv.addObject("sectionName", "member/login.jsp");
			mv.addObject("urlpattern", "member/login");
		} else {
			int totalCnt = boardservice.selectBoardTotalCnt(mid, type, boardCategory, searchRange, searchword);
			Map<String, Object> pagingMap = Paging.paging(page, totalCnt, limits, pageLimit);
	
			mv.addObject("sectionName", "mypage/myboard.jsp");
			mv.addObject("urlpattern", "mypage/board");
			mv.addObject("boardList", boardservice.selectBoardList(mid, type, boardCategory, searchRange, searchword, page, limits));
			mv.addObject("pagingMap", pagingMap);
			mv.addObject("type", type);
			mv.addObject("boardCategory", boardCategory);
			mv.addObject("searchword", searchword);
			mv.addObject("searchRange", searchRange);
			mv.addObject("mrole", request.getSession().getAttribute("mrole"));
		}
		mv.setViewName("index");
		
		return mv;
	}
	
	
	
	

	
	
	
	
}
