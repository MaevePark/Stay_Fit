package kh.project.stayfit.common;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.Environment;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CloudinaryUpload {

	@Autowired
	private Environment env;
	@Value("${CLOUDINARY_URL}")
	private String CLOUDINARY_URL;
	
/*	@PostMapping("/insert")
	public String insert(업로드때 쓰는 VO파일
			, @RequestParam(name="uploadfile") MultipartFile multipartFile
			, HttpServletRequest request
			)  throws Exception {
		
		
		String savedFileName = FileSave.saveFile(multipartFile, FileSave.FILE_BOARD_PATH, request);
		String fullSavedFileName = FileSave.FILE_BOARD_PATH + savedFileName;
		String fullOriginalFilename = FileSave.FILE_BOARD_PATH + multipartFile.getOriginalFilename();
		String localFilePath = request.getSession().getServletContext().getRealPath("") + FileSave.FILE_BOARD_PATH;

		if(savedFileName == null) {
			//첨부파일이 없는 경우
		} else {
			//첨부파일이 첨부된 경우
			bvo.setBoardRenameFileName(fullSavedFileName);
			bvo.setBoardOriginalFileName(fullOriginalFilename);
			
			Dotenv dotenv = Dotenv.load();
			Cloudinary cloudinary = new Cloudinary(dotenv.get("CLOUDINARY_URL"));
			cloudinary.config.secure = true;
			
			try {
				// Upload the image
				Map params1 = ObjectUtils.asMap(
				    "use_filename", true,
				    "unique_filename", false,
				    "overwrite", true
				);
				System.out.println(cloudinary.uploader().upload(localFilePath+savedFileName, params1));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		int result = service.insertBoard(bvo);
		
		return "redirect:/board/list";
	}
	*/
	
}
