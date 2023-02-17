package kh.project.stayfit.seller.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	@GetMapping("/productupdate")
	@ResponseBody
	public int updateProduct(SellerProduct vo) throws Exception{
		
		int result = service.updateProduct(vo);

		return result;
	}
	
	
	// 상품등록
	@PostMapping("/productinsert")
	public String insertProduct(SellerProduct vo, // 파라미터들을 @RequestParam으로 받지 않고 vo로도 받을 수 있음 (name과 vo의 필드명이 같다면)
								@RequestParam("uploadFile") MultipartFile multipartFile,
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
			System.out.println(cloudinary.uploader().upload(localFilePath + savedFileName, params1));
			
			// vo에 이미지 url 저장 TODO
			vo.setPimage(localFilePath + savedFileName);

		} catch (Exception e) {
			e.printStackTrace();
		}

		int result = service.insertProduct(vo);
		
		if(result == 1) {
			return "redirect:/seller/product";
		} else {
			return "redirect:/error"; // TODO
		}

	}
}
