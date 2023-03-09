package kh.project.stayfit.seller.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.cloudinary.json.JSONArray;
import org.cloudinary.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.api.ApiResponse;
import com.cloudinary.utils.ObjectUtils;
import com.google.gson.Gson;

import io.github.cdimascio.dotenv.Dotenv;
import kh.project.stayfit.common.FileSave;
import kh.project.stayfit.seller.model.service.ProductService;
import kh.project.stayfit.seller.model.vo.SellerProduct;

@Controller
@RequestMapping("/seller")
public class ProductController {

	public static String FILE_PRODUCT_PATH = "/resources/product/";
	@Autowired
	private ProductService service;
	@Autowired
	private Environment env;
	@Value("${CLOUDINARY_URL}")
	private String CLOUDINARY_URL;

	
	@GetMapping("/product")
	public ModelAndView product(ModelAndView mv) {

		mv.addObject("currentMenu", 1);
		mv.setViewName("/seller/product");

		return mv;
	}

	@GetMapping("/form")
	public ModelAndView form(ModelAndView mv) {

		mv.addObject("currentMenu", 2);
		mv.setViewName("/seller/form");

		return mv;
	}

	
	// 상품목록
	@GetMapping("/productlist")
	@ResponseBody
	public String selectProduct(@RequestParam(name="searchword", required=false) String searchword,
								@RequestParam("category") String category,
								@RequestParam("sort") String sort
								) throws Exception {
		
		List<SellerProduct> list = service.selectProduct(searchword, category, sort);

		return new Gson().toJson(list);
	}

	
	// 상품수정
	@PostMapping("/productupdate")
	@ResponseBody
	public int updateProduct(SellerProduct vo, // 파라미터들을 @RequestParam으로 받지 않고 vo로도 받을 수 있음 (name과 vo의 필드명이 같다면)
							@RequestParam(name = "upload", required = false) MultipartFile multipartFile, // 여기선 required = false로!!
							HttpServletRequest request
							) throws Exception {
		
		// multipartFile 이 있을 때 : '새로운 이미지 업로드'시
		if(multipartFile != null) {
			
			String savedFileName = FileSave.saveFile(multipartFile, FileSave.FILE_PRODUCT_PATH, request);
			String localFilePath = request.getSession().getServletContext().getRealPath("") + FileSave.FILE_PRODUCT_PATH;
			Dotenv dotenv = Dotenv.load();
			Cloudinary cloudinary = new Cloudinary(dotenv.get("CLOUDINARY_URL"));
			cloudinary.config.secure = true;
			
			try {
				// https://res.cloudinary.com/doxmm0ofz/image/upload/v1677233838/fd689c23-b84a-4d19-8292-87cfdc656201_w_20220207180134_5798062860.jpg
				String originalImage = vo.getPimage();  // 기존 이미지 url
				
				// <url에서 마지막 / 와 . 사이에 글자만 잘라내기>
				// 1. 마지막 /와 .의 인덱스를 찾기
				int lastSlashIndex = originalImage.lastIndexOf('/');
				int lastDotIndex = originalImage.lastIndexOf('.');
				// 2. 인덱스를 이용하여 마지막 /와 . 사이에 있는 문자열을 추출
				String publicId = originalImage.substring(lastSlashIndex + 1, lastDotIndex);
				
				System.out.println(publicId); // 출력: fd689c23-b84a-4d19-8292-87cfdc656201_w_20220207180134_5798062860

				// 이미지 업로드
				Map params1 = ObjectUtils.asMap("use_filename", true, "unique_filename", false, "overwrite", true);
				Map result = cloudinary.uploader().upload(localFilePath + savedFileName, params1); // 업로드시 map형태로 파일정보를 리턴함.
				System.out.println("★★★ result : " + result);
				String url = result.get("secure_url").toString();
				System.out.println("★★★ url : " + url);
				
				// vo에 새 이미지 url 저장
				vo.setPimage(url);
				
				// 기존 이미지가 있었다면 그 이미지 삭제
				if(originalImage != null && !originalImage.equals("")) {
			        try {
			            cloudinary.uploader().destroy(publicId, ObjectUtils.emptyMap());
			            System.out.println("File deleted successfully.");
			        } catch (Exception e) {
			            System.out.println("Error occurred while deleting file: " + e.getMessage());
			        }
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
		} 
		
		// multipartFile 이 없을 때 : '이전 이미지로' 클릭시, 또는 파일선택창에서 '취소' 클릭시  -> input type="hidden"으로 받아 온 기존 pimage 그대로 DB에 유지
		
		int result = service.updateProduct(vo);

		return result;
	}
	
	// 상품 삭제
	@PostMapping("/productdelete")
	@ResponseBody
	public int deleteProduct(@RequestParam("pid") String pid) throws Exception {
		
		int result = service.deleteProduct(pid);

		return result;
	}
	
	// 상품등록
	@PostMapping("/productinsert")
	public ModelAndView insertProduct(ModelAndView mv,
								SellerProduct vo, // 파라미터들을 @RequestParam으로 받지 않고 vo로도 받을 수 있음 (name과 vo의 필드명이 같다면)
								@RequestParam("uploadFile") MultipartFile multipartFile, // 대신 얘는 name 다르게 해서 이렇게 따로 받아줘야함
								HttpServletRequest request
								) throws Exception {

		String savedFileName = FileSave.saveFile(multipartFile, FileSave.FILE_PRODUCT_PATH, request);
		String localFilePath = request.getSession().getServletContext().getRealPath("") + FileSave.FILE_PRODUCT_PATH;

		Dotenv dotenv = Dotenv.load();
		Cloudinary cloudinary = new Cloudinary(dotenv.get("CLOUDINARY_URL"));
		cloudinary.config.secure = true;
		
		try {
			// 이미지 업로드
			Map params1 = ObjectUtils.asMap("use_filename", true, "unique_filename", false, "overwrite", true);
			Map result = cloudinary.uploader().upload(localFilePath + savedFileName, params1); // 업로드시 map형태로 파일정보를 리턴함.
			System.out.println("★★★ result : " + result);
			String url = result.get("secure_url").toString();
			System.out.println("★★★ url : " + url);
			
			// vo에 이미지 url 저장
			vo.setPimage(url);
			
		} catch (Exception e) {
			e.printStackTrace();
		}

		int result = service.insertProduct(vo);
		
		if(result == 1) {
			mv.addObject("func", "productInsertSuccess");
			mv.addObject("msg", "상품 등록에 성공하였습니다.");
			mv.setViewName("/seller/resultAlert");
			return mv;
		} else {
			mv.addObject("func", "productInsertSuccess");
			mv.addObject("msg", "상품 등록에 실패하였습니다.");
			mv.setViewName("/seller/resultAlert");
			return mv;
		}
	}
}
