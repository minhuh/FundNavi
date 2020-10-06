package com.hm.project.front.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

/**
 * @FileName : UploadController.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : アップロードのcontroller
 */
@Controller
@Log4j
public class UploadController {

	@GetMapping("/projectWrite")
	public void uploadForm() {

		log.info("upload form");
	}

	private String getFolder() { // 년월일 구해서 문자로 리턴해줌

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		Date date = new Date();

		String str = sdf.format(date);

		return str.replace("-", File.separator);
	}

	private boolean checkImageType(File file) { // 이미지인지 아닌지 확인, 컨텐츠타입을 확인 image

		try {
			String contentType = Files.probeContentType(file.toPath());

			return contentType.startsWith("image");

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return false;
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

//	   폴더
		String uploadFolder = "D:\\spring\\good\\src\\main\\webapp\\resources\\upload";

		// make folder --------
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload path: " + uploadPath);

		if (uploadPath.exists() == false) { // 년월일로 폴더가 안만들어져있으면 폴더 만들고 아니면 넘어감
			uploadPath.mkdirs();
		}
		// make yyyy/MM/dd folder

		for (MultipartFile multipartFile : uploadFile) {

			log.info("-------------------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());

			// 다중 upload에서 모두 upload시키지 않고 몇개만 upload 된다면 빠지는 multipartFile 은 제외시킨다.
			if (multipartFile.getSize() > 0) {

				String uploadFileName = multipartFile.getOriginalFilename();

				// IE has file path
				uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf("\\") + 1); // 오리지널 파일 이름만 가지고 옴
				log.info("only file name: " + uploadFileName);

				UUID uuid = UUID.randomUUID(); // 랜덤한 문자열을 구할 수 있는게 UUID

				uploadFileName = uuid.toString() + "_" + uploadFileName; // 두개를 합침, 랜덤이름+오리지널파일이름

				try {
					File saveFile = new File(uploadPath, uploadFileName); // 파일을 하나씩 저장함 위에 반복문이라서
					multipartFile.transferTo(saveFile);

					// upload 된 파일이 이미지일 경우 썸네일을 제작
					if (checkImageType(saveFile)) { // 이미지인지 아닌지 확인. 밑에 코드들 썸네일 제작하는 코드

						FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName)); // 이미지를
																														// 업로드하면
																														// s_가
																														// 붙어서
																														// 썸네일인지
																														// 오리지널파일인지
																														// 확인가능

						// 썸네일 사이즈를 지정해준다. 프로젝트에 따라 썸네일의 크기를 조절해서 사용
						Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100); // (파일객체,
																											// 사이즈) 사이즈만
																											// 조절해 주면 됨
						thumbnail.close();
					}

				} catch (Exception e) {
					e.printStackTrace();
				} // end catch
			}
		} // end for

	}

	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {

		log.info("deleteFile: " + fileName);

		File file;

		try {
			file = new File("c:\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {

				String largeFileName = file.getAbsolutePath().replace("s_", "");

				log.info("largeFileName: " + largeFileName);

				file = new File(largeFileName);

				file.delete();
			}

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);

	}

}