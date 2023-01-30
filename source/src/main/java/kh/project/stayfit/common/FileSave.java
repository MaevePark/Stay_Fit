package kh.project.stayfit.common;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component
public class FileSave {
	public static String FILE_BOARD_PATH = "\\resources\\board\\";
	public static String FILE_PROFILE_PATH = "\\resources\\profile\\";
	
	// MultipartFile 형태에서 file용 fileServer에 저장하고 저장한 file의 이름을 return하도록 설계  
	public static String saveFile(MultipartFile multipartFile
			, String filepath
			, HttpServletRequest request
			) throws Exception {
		String savedFileName = null;
		
		String path = request.getSession().getServletContext().getRealPath("");
		System.out.println("#####################################");
		System.out.println("path : " +path);
		System.out.println("filepath : " +filepath);
		System.out.println("multipartFile.getOriginalFilename() : " +multipartFile.getOriginalFilename());
		
		path += filepath;
		File folder = new File(path);
		if(folder.exists() == false) {
			folder.mkdirs();
		}
		
		if(!multipartFile.getOriginalFilename().equals("")) {
			System.out.println("#####################################");
			System.out.println("파일 있워오");
			// 파일 개수가 많아지면 폴더를 따로 만들어준다.
			//if(folder.listFiles().length > 20) {}
			
			// 날짜별 폴더 생성
			//if()
			
			// 파일 rename - 파일명 중복 방지(time 활용)
			/*
			 * long renameByTime = System.currentTimeMillis(); savedFileName = renameByTime
			 * + multipartFile.getOriginalFilename();
			 * savedFileName = renameByTime+ "_" +multipartFile.getOriginalFilename();
			 */
			
			//파일 rename - 파일명 중복 방지(UUID 활용)
			savedFileName = UUID.randomUUID().toString() + "_" + multipartFile.getOriginalFilename();
			
			// 파일 저장
			try {
				multipartFile.transferTo(new File(path + savedFileName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			System.out.println("#####################################");
			System.out.println("파일 없워오");
		}
		
		if(!folder.exists()) {
			
		}
		
		return savedFileName;
	}
}
