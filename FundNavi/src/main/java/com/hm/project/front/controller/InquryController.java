package com.hm.project.front.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.project.domain.Criteria;
import com.hm.project.domain.InquryVO;
import com.hm.project.domain.PageDTO;
import com.hm.project.front.service.InquryService;
import com.hm.project.util.UploadUtils;

import lombok.extern.log4j.Log4j;

/**
 * @FileName : InquryController.java
 * @Date : 2020. 2. 26.
 * @Author : ホミン
 * @ProgramExplanation : お問い合わせのcontroller
 */
@Controller
@Log4j
public class InquryController {

	@Autowired
	private InquryService service;

	@Value("${globalConfig.uploadPath}")
	private String uploadPath;

	/**
	 * @MethodExplanation : お問い合わせのリストページ
	 * @MethodName : onetoone
	 * @Date : 2020. 2. 26.
	 * @Author : ホミン
	 * @param cri
	 * @param model
	 * @return call jsp view
	 */
	@GetMapping("/onetoone")
	public String onetoone(Criteria cri, Model model) {
		log.info("Welcome onetoone!");
		log.info("list: " + cri);
		model.addAttribute("list", service.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 123));
		int total = service.getTotal(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "front/onetoone";
	}

	/**
	 * @MethodExplanation : 問い合わすページ
	 * @MethodName : otoform
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @return
	 */
	@GetMapping("/otoform")
	@PreAuthorize("isAuthenticated()")
	public String otoform() {

		log.info("Welcome otoform!");

		return "front/otoform";
	}

	/**
	 * @MethodExplanation : 問い合わす内容を送る機能
	 * @MethodName : otoform2
	 * @Date : 2020. 2. 27.
	 * @Author : ホミン
	 * @param uploadFile
	 * @param inqury
	 * @param rttr
	 * @return
	 */
	@PostMapping("/otoform")
	@PreAuthorize("isAuthenticated()")
	public String otoform2(MultipartFile[] uploadFile, InquryVO inqury, RedirectAttributes rttr) {

		log.info("InquryVO_test:" + inqury);
		log.info("testtest:" + uploadFile);
		log.info("register: " + inqury);
		service.register(inqury);
		rttr.addFlashAttribute("result", inqury.getInqury_num());
		return "redirect:/onetoone";
	}

	 /**
	  * @MethodExplanation : 問い合わせの詳細ページ
	  * @MethodName : onedetail
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param inqury_num
	  * @param model
	  * @return
	  */
	@GetMapping("/onedetail")
	public String onedetail(@RequestParam("inqury_num") Long inqury_num, Model model) {
		log.info("Welcome inquryDetail!");
		log.info("inqury_num: " + inqury_num);
		model.addAttribute("inqury", service.get(inqury_num));
		return "front/onedetail";
	}

	 /**
	  * @MethodExplanation :　問い合わせの削除機能
	  * @MethodName : removeInqury
	  * @Date : 2020. 2. 27.
	  * @Author : ホミン
	  * @param inqury_num
	  * @return
	  */
	@PostMapping("/InquryDelete")
	@PreAuthorize("isAuthenticated()")
	public String removeInqury(long inqury_num) {

		service.InquryDeleting(inqury_num);

		return "redirect:/onetoone";
	}

}
