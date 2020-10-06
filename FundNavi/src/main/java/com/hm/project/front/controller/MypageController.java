package com.hm.project.front.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.hm.project.domain.MemberVO;
import com.hm.project.front.service.MemberService;
import com.hm.project.util.UploadUtils;

import lombok.extern.log4j.Log4j;

/**
 * @FileName : MypageController.java
 * @Date : 2020. 2. 27.
 * @Author : ホミン
 * @ProgramExplanation : マイページのcontroller
 */
@Controller
@Log4j
public class MypageController {

	@Autowired
	private MemberService service;

	@Value("${globalConfig.uploadPath}")
	private String uploadPath;


	 /**
	  * @MethodExplanation :　登録したプロジェクトリスト
	  * @MethodName : mypageMyProject
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param userid
	  * @param principal
	  * @param model
	  * @return
	  */
	@GetMapping(value = "/mypageMyProject")
	public String mypageMyProject(String userid, Principal principal, Model model) {

		log.info("Welcome mypageMyProject!");

		userid = principal.getName();

		model.addAttribute("project", service.myPageProject(userid));

		model.addAttribute("projectEnd", service.myPageProjectEnd(userid));

		return "front/mypageMyProject";
	}

	 /**
	  * @MethodExplanation : プロフィールの管理
	  * @MethodName : profileEditing
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @return
	  */
	@GetMapping("/profileEdit")
	public String profileEditing() {
		log.info("Welcome profileEdit!");

		return "front/profileEdit";
	}

	
	 /**
	  * @MethodExplanation :　プロフィール管理の機能
	  * @MethodName : profileEdit
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param member
	  * @param principal
	  * @param uploadFile
	  * @return
	  */
	@RequestMapping("/profileEdit")
	@PostMapping("/profileEdit")
	public String profileEdit(MemberVO member, Principal principal, MultipartFile uploadFile) {

		log.info("profileEdit!");

		log.info("upload : " + uploadFile);

		// 프로필 사진
		member.setProfile_image(UploadUtils.uploadFormPost(uploadFile, uploadPath));

		String userid = principal.getName();

		log.info("image : " + member.getProfile_image());

		member.setUserid(userid);

		service.update(member);

		return "redirect:/myPage";
	}

}