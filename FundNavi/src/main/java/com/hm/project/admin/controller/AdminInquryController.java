package com.hm.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hm.project.admin.service.AdminInquryService;
import com.hm.project.domain.Criteria;
import com.hm.project.domain.InquryVO;
import com.hm.project.domain.PageDTO;

import lombok.extern.log4j.Log4j;


 /**
  * @FileName	: AdminInquryController.java
  * @Date		: 2020. 2. 26. 
  * @Author		: ホミン
  * @ProgramExplanation : お問い合わせ管理　controller
  */

@Controller
@Log4j
public class AdminInquryController {
	
	@Autowired
	private AdminInquryService service;
	
	
	@Value("${globalConfig.uploadPath}")
	private String uploadPath;
	
	 /**
	  * @MethodExplanation :　お問い合わせのリストページ
	  * @MethodName : getInquryList
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param cri
	  * @param model
	  * @return　call jsp view
	  */
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/admin/admin_1-1inqury")
	public String getInquryList(Criteria cri, Model model) {
		  log.info("Welcome admin_1-1inqury!");
		  log.info("list: " + cri);
	      model.addAttribute("list", service.getListWithPaging(cri));
	      int total = service.getTotal(cri);
	      log.info("total: " + total);
	      model.addAttribute("pageMaker", new PageDTO(cri, total));
	      return "admin/admin_1-1inqury";
	}
	
	 /**
	  * @MethodExplanation : お問い合わせの詳細ページ
	  * @MethodName : inquryView
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param inqury_num
	  * @param model
	  * @return
	  */
	@GetMapping("/admin/admin_1-1inquryView")
	public String inquryView(@RequestParam("inqury_num") Long inqury_num, 
			                Model model) {
		log.info("Welcome admin_1-1inquryView!");
		log.info("====inqury_num: " + inqury_num);
		model.addAttribute("inqury", service.get(inqury_num));
		return "admin/admin_1-1inquryView";
	}
	
	 /**
	  * @MethodExplanation :　お問い合わせの修正ページ
	  * @MethodName : inquryView2
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param inqury
	  * @param rttr
	  * @return
	  */
	@PostMapping("/admin/admin_1-1inquryView")
	public String inquryView2(InquryVO inqury, 
			                  RedirectAttributes rttr) {
		log.info("update: " + inqury);
		inqury.setRipple_check("Y");
		service.update(inqury);
		rttr.addFlashAttribute("result", inqury.getInqury_num());
		return "redirect:/admin/admin_1-1inquryView?inqury_num=" + inqury.getInqury_num();
	}
	
	 /**
	  * @MethodExplanation :　お問い合わせの削除ページ
	  * @MethodName : removeInqury
	  * @Date : 2020. 2. 26.
	  * @Author : ホミン
	  * @param inqury_num
	  * @return
	  */
	@PostMapping("/admin/InquryDelete")
	public String removeInqury(long inqury_num) {
		
		service.InquryDeleting(inqury_num);
		
		return "redirect:/admin/admin_1-1inqury";
	}
}
