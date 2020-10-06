package com.hm.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.project.admin.service.AdminNoticeService;
import com.hm.project.domain.Criteria;
import com.hm.project.domain.NoticeVO;
import com.hm.project.domain.PageDTO;
import com.hm.project.util.UploadUtils;

import lombok.extern.log4j.Log4j;

/**
 * @FileName : AdminNoticeController.java
 * @Date : 2020. 2. 26.
 * @Author : ホミン
 * @ProgramExplanation : お知らせ controller
 */
@Controller
@Log4j
@RequestMapping("/admin/*")

public class AdminNoticeController {

	@Autowired
	private AdminNoticeService service;

	@Value("${globalConfig.uploadPath}")
	private String uploadPath;

	/**
	 * @MethodExplanation : お知らせのリストページ
	 * @MethodName : getNoticeList
	 * @Date : 2020. 2. 26.
	 * @Author : ホミン
	 * @param cri
	 * @param model
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin_inqury")
	public String getNoticeList(Criteria cri, Model model) {

		log.info("list: " + cri);
		model.addAttribute("list", service.getListWithPaging(cri));
		int total = service.getTotalCount(cri);
		log.info("total: " + total);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		return "admin/admin_inqury";
	}
	
	 /**
	  * @MethodExplanation :　お知らせの作成ページ
	  * @MethodName : inquryWrite
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @return
	  */
	@GetMapping("/admin_inquryWrite")
	public String inquryWrite() {
		log.info("Welcome admin_inquryWrite!");

		return "admin/admin_inquryWrite";
	}

	 /**
	  * @MethodExplanation :　お知らせの作成の機能
	  * @MethodName : inquryWrite2
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param uploadFile
	  * @param board
	  * @param rttr
	  * @return
	  */
	@PostMapping("/admin_inquryWrite")
	public String inquryWrite2(MultipartFile[] uploadFile, NoticeVO board, RedirectAttributes rttr) {
		int index = 0;
		log.info("testtest:" + uploadFile.toString());
		for (MultipartFile multipartFile : uploadFile) {
			if (multipartFile.getSize() > 0) {
				if (index == 0) {
					board.setAttach(UploadUtils.uploadFormPost(multipartFile, uploadPath));
				}
				index++;
			}
		}
		log.info("register: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getNotice_num());
		return "redirect:/admin/admin_inqury";
	}

	 /**
	  * @MethodExplanation :　お知らせの詳細ページ
	  * @MethodName : inquryView
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param notice_num
	  * @param model
	  * @return
	  */
	@GetMapping("/admin_inquryView")
	public String inquryView(@RequestParam("notice_num") Long notice_num, Model model) {
		log.info("Welcome admin_inquryView!");
		log.info("notice_num: " + notice_num);
		model.addAttribute("notice", service.get(notice_num));
		return "admin/admin_inquryView";
	}

	 /**
	  * @MethodExplanation :　お知らせの
	  * @MethodName : get
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param notice_num
	  * @param cri
	  * @param model
	  */
	@GetMapping({ "/get", "/modify" })
	public void get(@RequestParam("notice_num") Long notice_num, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
		model.addAttribute("board", service.get(notice_num));
	}



}
